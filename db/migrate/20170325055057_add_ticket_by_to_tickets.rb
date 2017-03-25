class AddTicketByToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :ticket_by, :string
  end
end
