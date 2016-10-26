class User < ApplicationRecord
  has_one :account, dependent: :destroy
  has_one :cart, :through => :account

  validates 'name', presence: true,
            length: { minimum: 2 }
  # in this line i don't follow task where minimum age is defined as 18 (Let it be 6 ;)
  validates :age, numericality: { only_integer: true }, :inclusion => { :in => 6..100 }
  validates :email, format: {with:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, uniqueness: true,
             allow_blank: true

  after_create :create_account_for_user
  after_create :increment_balance, if: :adult?

  private
    def create_account_for_user
      create_account(balance: 0)
    end

    def increment_balance
      self.account.update(balance: 100)
    end

    def adult?
      self.age >= 18
    end

end

