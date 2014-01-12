module StoreHelper

	def show_date
		time = Time.now
		return time.strftime("%b %e, %Y")
	end

	def show_time		
		time = DateTime.now
		if time.hour >= 12
			stamp = "P.M"
			stamp_hour = time.hour - 12
		else
			stamp = "A.M"
			stamp_hour = time.hour
		end
		return "#{stamp_hour}:#{time.strftime("%M")} #{stamp}"	
	end
end
