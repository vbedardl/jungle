require 'rails_helper'

RSpec.describe User, type: :model do
  @newUser = User.create({
    name:'Jamie',
    email:'jb@gmail.com',
    password:'asd123!',
    password_confirmation:'asd123!'
  })

  describe 'Validations' do
    it("should create a user") do
      expect { User.create({
        name:'vincent',
        email:'vb@gmail.com',
        password:'asd123!',
        password_confirmation:'asd123!'
    })}.to change{User.count}
    end
    
    it('should have password and password_confirmation field') do
      expect { User.create({
        name:'vincent',
        email:'vb@gmail.com',
        password:'asd123!',
        password_confirmation:'asd123!'
    })}.to change {User.count}
    end

    it('should not pass if password do not match password_confirmation') do
      expect { User.create({
        name:'vincent',
        email:'vb@gmail.com',
        password:'abc123!',
        password_confirmation:'asd123!'
    })}.not_to change {User.count}
    end

    it('Email must be unique') do
      expect { 
        User.create({
          name:'vincent',
          email:'jb@gmail.com',
          password:'asd123!',
          password_confirmation:'asd123!'
        })
    }.not_to change {User.count}
    end

    it('Email should be required') do
      expect { User.create({
        name:'vincent',
        email: nil,
        password:'asd123!',
        password_confirmation:'asd123!'
    })}.not_to change {User.count}
    end

    it('Name should be required') do
      expect { User.create({
        name:'vincent',
        email: 'vb@gmail.com',
        password:'asd123!',
        password_confirmation:'asd123!'
    })}.to change {User.count}
    end

    it('password must have minimum length of 7') do
      expect { User.create({
        name:'vincent',
        email:'va@gmail.com',
        password:'as',
        password_confirmation:'as'
    })}.not_to change {User.count}
      expect { User.create({
        name:'vincent',
        email:'vb@gmail.com',
        password:'asd123!',
        password_confirmation:'asd123!'
    })}.to change {User.count}
    end
  end
end
