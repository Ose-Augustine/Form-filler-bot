require 'selenium-webdriver'
require 'webdrivers'
require 'faker'

# class Bot 
#     @@options = Selenium::WebDriver::Edge::Options.new(args:['headless'])
#     @@driver = Selenium::WebDriver.for(:edge, options: @@options)
#     @@driver.navigate.to "https://docs.google.com/forms/d/e/1FAIpQLScRWyqpgDXKHu6pV1wEhewUIEnrHiiTnvQFgJ8SLtiGx7EebQ/viewform"

#     def questions_with_input_fields(*args)
#         nodes = []
#         args.each do |question|
#             node = @@driver.find_element(:xpath, "//span[text()= '#{question}']")
#             nodes << node.text 
#         end
#         p nodes
#         @@driver.quit
#     end

#     def find_input_fields 
#         fields = @@driver.find_elements(:xpath, "//input[@type='text']")
#         @@driver.quit
#         fields 
#     end 

#     # Accepts country, name, email address and retuns 
#     # Fake data using faker gem
 

# end

def propmt_field_data_type(number_of_fields)
    p 'What kind of data are you expecting'
    p 'E.g country, number, email address'
    data = []
    number_of_fields.times do 
        p "This would ask you #{number_of_fields} time(s)"
        answer = gets.chomp
        data << answer 
    end 

    return data
end 


def generate_fake_with_prompts(array)
    data = []
    array.each do |element| 
        case element
        when "country"
            data << Faker::Nation.nationality
        when "number" 
            random = rand(10)
            data << random
        else
            p"Watch out for more data support"
        end 
    end

    return data
end 

#robot = Bot.new 
#robot.questions_with_input_fields('What is your name?')
#inputs = robot.find_input_fields 
data_types = propmt_field_data_type(2) 
fake_data = generate_fake_with_prompts(data_types) 
p fake_data
