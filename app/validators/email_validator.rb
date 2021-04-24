class EmailValidator < ActiveModel::Validator
    def validate(record)
        unless record.email.match?(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)
            record.errors.add :email, "provided is not an email"
        end
    end
end