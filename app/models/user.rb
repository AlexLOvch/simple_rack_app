class User < ActiveRecord::Base
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def error_code
    if errors.any?
      email_errors_values = errors.details[:email].map{|e|e[:error]}
      puts "email_errors_values:#{email_errors_values}"
      puts "errors.details[:email]:#{errors.details[:email]}"
      return :email_missing if email_errors_values.include?(:blank)
      return :email_already_exists if email_errors_values.include?(:taken)
      return :wrong_email_format if email_errors_values.include?(:invalid)
    end
  end
end