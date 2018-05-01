if User.select(:is_admin => true).empty?
  User.create(:username => 'admin',
              :is_active => true,
              :is_admin => true,
              :email => 'example@example.org',
              :password => '000000'
  )
  Rails.logger.info('Temporary admin user admin@000000 has been created')
end