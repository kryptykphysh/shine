class AddEmailConstraintToUsers < ActiveRecord::Migration
  def up
    execute %(
      ALTER TABLE
        users
      ADD CONSTRAINT
        email_must_be_companys_email
      CHECK ( email ~* '[A-Za-z0-9._%]+@example.com' )
    )
  end

  def down
    execute %(
      ALTER TABLE
        users
      DROP CONSTRAINT
        email_must_be_comapnys_email
    )
  end
end
