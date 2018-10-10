class GamesController < ApplicationController
	def eight_ball
		render :eight_ball
	end

	def eight_ball_result
		answers = [
      "Yummy",
      "No",
			"LOL!",
			"OMG!",
			"Sick",
			"Yes you can!",
			"Not a good idea",
			"Don't do it",
			"That god!",
			"Yes",
			"I see it coming",
			"Told you so"
		]

    my_reply = answers.sample

		@question = params[:question]

    @answer = my_reply

		render :eight_ball_result
	end

	def secret_number
		render :secret_number
	end

	def secret_number_result

    @secret_number = [1,2,3,4,5,6,7,8,9,10].sample

		@answer = params[:userchoice]

		@winner = true if ( @secret_number == @answer.to_i )
		render :secret_number_result
	end

end
