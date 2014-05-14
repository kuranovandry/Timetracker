class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :avatar

  rails_admin do
    nestable_list true
    list do
      field :email
      field :current_sign_in_at
      field :sign_in_count
		end

		edit do
			field :email
			field :password
			field :password_confirmation
			field :avatar
    end

  end
  
end
