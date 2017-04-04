class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :confirmable
  
has_attached_file :avatar, styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :tickets
  has_one :package
  has_many :testimonies
  has_many :active_matches, class_name:  "Match",
                                  foreign_key: "giver_id",
                                  dependent:   :destroy
   has_many :passive_matches, class_name:  "Match",
                                   foreign_key: "receiver_id",
                                   dependent:   :destroy

    has_many :receivers, through: :active_matches
    has_many :givers, through: :passive_matches
    has_many :notifications, foreign_key: :recipient_id


    def match(other_user)
    active_matches.create(giver_id: other_user.id)
  end

  # Unfollows a user.
  def unmatch(other_user)
    active_matches.find_by(giver_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def matched?(other_user)
    matched.include?(other_user)
  end

end
