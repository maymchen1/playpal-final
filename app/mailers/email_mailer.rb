class EmailMailer < ApplicationMailer

    def registration_confirmation(player_profile)
        @player_profile = player_profile
        mail(to: @player_profile.email, subject: 'Registration Confirmation')
      end
    end
