module AppParametersSetter
	class AppParameter

		def self.load
			print "#{Rails.root}\n"
			params = YAML.load_file("#{Rails.root}/config/app_parameters.yml")[Rails.env]
			params.each do |key,value|
				if value.is_a? String
					result = value.match(/^\$(.*)/)
					if !result.nil?
						raise "cant start : Unknow shell variable #{value}" if ENV[result[1]].nil?
						value = ENV[result[1]] 
					end
				end
				self.const_set(key.upcase,value)
			end
		end
		def self.reload!
			print "reload!"
		end


	end
end