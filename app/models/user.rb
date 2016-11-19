class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
  #attr_accessor :email, :password, :password_confirmation, :remember_me, :encrypted_password

  has_one :account, dependent: :destroy
  has_one :cart, :through => :account

  validates :name, presence: true,
            length: { minimum: 2 }

  validates :age, numericality: { only_integer: true }, :inclusion => { :in => 6..100 }
  validates :email, format: {with:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, uniqueness: true,
             allow_blank: true

  after_create :create_account_for_user
  after_create :increment_balance, if: :adult?

  private

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first


    # Uncomment the section below if you want users to be created if they don't exist
     unless user
         user = User.create!(age:20, name: data["name"],
            email: data["email"],
            password: Devise.friendly_token[0,20]
         )
     end
    user
  end

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

