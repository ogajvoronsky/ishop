class User < ApplicationRecord
  has_one :account
  has_one :cart, :through => :account

  validates 'name', presence: true,
            length: { minimum: 2 }
  # in this line i 
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 6, less_than_or_equal_to: 100 }
  validates :email, format: {with:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, uniqueness: true,
             allow_nil: true, allow_blank: true

  after_create :create_account_for_user
  after_create :increment_balance, if: :adult?

  protected
    def create_account_for_user
      Account.new(user_id: self.id, balance: 0).save
    end

    def increment_balance
      (Account.find_by user_id: self.id).update_column('balance', 100)
    end

    def adult?
      self.age >= 18
    end

end

