require 'rails_helper'

RSpec.describe User, type: :model do
  @newUser = User.create({
    first_name:'Jamie',
    last_name: 'Blair',
    email:'jbv@gmail.com',
    password:'asd123!',
    password_confirmation:'asd123!'
  })

  describe 'Validations' do
    it("should create a user") do
      expect { User.create({
        first_name:'vincent',
        last_name:'Bedard',
        email:'vb@gmail.com',
        password:'asd123!',
        password_confirmation:'asd123!'
    })}.to change{User.count}
    end
    
    it('should have password and password_confirmation field') do
      expect { User.create({
        first_name:'vincent',
        last_name:'Bedard',
        email:'vb@gmail.com',
        password:'asd123!',
        password_confirmation:'asd123!'
    })}.to change {User.count}
    end

    it('should not pass if password do not match password_confirmation') do
      expect { User.create({
        first_name:'vincent',
        last_name:'Bedard',
        email:'vb@gmail.com',
        password:'abc123!',
        password_confirmation:'asd123!'
    })}.not_to change {User.count}
    end

    it('Email must be unique') do
      expect { 
        User.create({
          first_name:'vincent',
          last_name:'Bedard',
          email:'jbv@gmail.com',
          password:'asd123!',
          password_confirmation:'asd123!'
        })
    }.not_to change {User.count}
    end

    it('Email should be required') do
      expect { User.create({
        first_name:'vincent',
        last_name:'Bedard',
        email: nil,
        password:'asd123!',
        password_confirmation:'asd123!'
    })}.not_to change {User.count}
    end

    it('Name should be required') do
      expect { User.create({
        first_name:'vincent',
        last_name:'Bedard',
        email: 'vb@gmail.com',
        password:'asd123!',
        password_confirmation:'asd123!'
    })}.to change {User.count}
    end

    it('password must have minimum length of 7') do
      expect { User.create({
        first_name:'vincent',
        last_name:'Bedard',
        email:'va@gmail.com',
        password:'as',
        password_confirmation:'as'
    })}.not_to change {User.count}
      expect { User.create({
        first_name:'vincent',
        last_name:'Bedard',
        email:'vb@gmail.com',
        password:'asd123!',
        password_confirmation:'asd123!'
    })}.to change {User.count}
    end
  end

  describe '.authenticate_with_credentials' do
    it('should log the user with the appropriate credentials') do
      user = User.find_by({email:'jbv@gmail.com'})
    loggedUser = User.authenticate_with_credentials('jbv@gmail.com', 'asd123!')
    expect(loggedUser).to eq(user)
    end

    it('should log if user has leading or trailing spaces') do
      user = User.find_by({email: 'jbv@gmail.com'})
      loggedUser = User.authenticate_with_credentials('  jbv@gmail.com ', 'asd123!')
      expect(loggedUser).to eq(user)
    end

    it('should log if user uppercase its email') do
      user = User.find_by({email: 'jbv@gmail.com'})
      loggedUser = User.authenticate_with_credentials('JBV@GMAIL.COM', 'asd123!') 
      expect(loggedUser).to eq(user)
    end
  end
end
