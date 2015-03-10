class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  ROLES = {
    0 => 'student',
    1 => 'teacher',
    2 => 'admin',
    99 => 'guest'
  }       

  has_and_belongs_to_many :groups
  has_many :post 
  has_one :departments
  belongs_to :departments
  
  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  field :name,               type: String
  field :surname,            type: String
  field :lastname,           type: String, default: ""
  field :age,                type: Integer,default: 0
  field :studentid,          type: String, default: ""
  field :gpa,                type: Float,  default: 0.0
  field :yearofstudy,        type: Integer,default: 1
  field :faculty,            type: String, default: ""
  field :specialization,     type: String, default: ""
  field :department,         type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 99
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  validates :name, presence: true
            # :length => { :minimum => 5 }
  validates :surname, presence: true
            # :length => { :minimum => 5 }

  def self.serialize_from_session(key, salt)
    record = to_adapter.get(key[0]["$oid"])
    record if record && record.authenticatable_salt == salt
  end

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  field :role, type: Integer, default: 0

  def is_student?
    role == 0
  end

  def is_admin?
    role == 2
  end

  def is_teacher?
    role == 1
  end

  def is_guest?
    role == 99
  end

end