require 'csv'
class Conf::Attendee < ActiveRecord::Base
  validates :name, :email, :check_code, :ticket_type, presence: true
  has_many :activities
  has_many :events, through: :activities
  paginates_per 20

  TICKET_TYPE_NAMES = ["Speaker or Staff / 講者或贊助商", "Enterprise / 企業票", "CFP Submitter", "Scholarship / 學生獎勵計劃", "Regular / 一般票"].reverse

  def ticket_type_name=(v)
    self.ticket_type = TICKET_TYPE_NAMES.index(v) + 1
  end

  def self.import_from_csv(file_path)
    res = []
    self.transaction do
      CSV.foreach(file_path, headers: true) do |csv|
        values = csv.to_hash.values
        unless self.find_by(id: values[0])
          res << self.create!(
            id: values[0],
            check_code: values[1],
            ticket_type_name: values[2],
            name: values[6],
            email: values[7],
            org: values[8],
            title: values[9],
            twitter: values[16],
            github: values[17]
          )
        end
      end
    end
    res
  end
end
