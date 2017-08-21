module MatchesHelper
  def find_new_match(current_user, last_match)
    user = User.find(current_user.id)

    match_type = :receiver

    if last_match
      match_type = :giver unless last_match.receiver == user
    end

    not_eligible = not_eligible(user)

    eligible = eligible(not_eligible, match_type)

    return false unless eligible.length

    match = eligible.sample

    if match_type.equal?(:giver)
      user.matches.create(giver: user, receiver: match)
    else
      user.matches.create(giver: match, receiver: user)
    end
  end

  private

  def eligible(not_eligible, match_type)
    # Now we need to get a list of users that are eligible
    # to be matched
    eligible = []
    User.where.not(id: not_eligible).each do |u|
      # Check to see that the user has never been matched
      # or that their last match was not as the matchType
      lastmatch = last_type(u)
      if !lastmatch
        eligible.push(u.id)
      else
        eligible.push(u) unless lastmatch != match_type
      end
    end
    return false unless eligible.length

    eligible
  end

  def not_eligible(user)
    # Get the unfinished matches, these are people that
    # that have an existing match, and are not eligible
    # to be matched
    not_eligible = [user.id]
    Match.where(finished: false).each do |match|
      not_eligible.push(match.giver_id, match.receiver_id)
    end

    not_eligible
  end

  def last_type(user)
    # Given a user, find the last match type they had
    return false unless user.givers.length || user.receivers.length


    giver = find_last_giver(user)
    receiver = find_last_receiver(user)

    return :receiver unless giver
    return :giver unless receiver

    return :receiver unless giver.created_on > receiver.created_on
    :giver
  end

  def find_last_giver(user)
    if user.givers.length.zero?
      return false
    end

    user.givers.last
  end

  def find_last_receiver(user)
    if user.receivers.length.zero?
      return false
    end

    user.receivers.last
  end
end
