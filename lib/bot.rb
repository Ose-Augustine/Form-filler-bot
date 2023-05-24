require 'selenium-webdriver'
require 'webdrivers'
require 'faker'

class Bot 
    @@options = Selenium::WebDriver::Edge::Options.new(args:['headless'])
    @@driver = Selenium::WebDriver.for(:edge, options: @@options)
    @@wait = Selenium::WebDriver::Wait.new(timeout: 100)
    @@driver.navigate.to "https://docs.google.com/forms/d/e/1FAIpQLScRWyqpgDXKHu6pV1wEhewUIEnrHiiTnvQFgJ8SLtiGx7EebQ/viewform"

    def questions_with_input_fields(*args)
        nodes = []
        args.each do |question|
            node = @@driver.find_element(:xpath, "//span[text()= '#{question}']")
            nodes << node.text 
        end
        p nodes
        @@driver.quit
    end

    def find_input_fields 
        fields = @@driver.find_elements(:xpath, "//input[@type='text']")
        fields 
    end 

    # Accepts country, name, email address and retuns 
    # Fake data using faker gem
    def propmt_field_data_type(number_of_fields)
        p 'What kind of data are you expecting'
        p 'E.g country, number, email address'
        p 'Please write in the order you expect them'
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
            when "name"
                data << Faker::Name.name 
            when "food" 
                data << Faker::Food.allergen
            when "number" 
                random = rand(10)
                data << random
            else
                p "#{element} not supported"
                p"Watch out for more data support"
            end 
        end
        return data
    end

    def interact_with_input_fields(fields, sample_data) 
        fields.zip(sample_data).each do |field, data|
            field.send_keys data
        end 
    end 

    def find_next_or_submit_button
        # button = @@wait.until {@@driver.find_element(:css, ".NPEfkd.RveJvd.snByac")}
        button = @@wait.until {@@driver.find_element(:xpath, "//span[text() = 'Submit']")}
        button ||= @@wait.until {@@driver.find_element(:xpath, "//span[text() = 'Next']")}
    end 

    def find_radio_parent
        # All parent divs of radio elements have 
        # the same class name
        parents = @@driver.find_elements(:xpath, "//div[@class='SG0AAe']")
        return parents
    end 

end 

robot = Bot.new 
#robot.questions_with_input_fields('What is your name?')
input_fields = robot.find_input_fields 
data_types = robot.propmt_field_data_type(4) 
fake_data = robot.generate_fake_with_prompts(data_types) 
p fake_data
robot.interact_with_input_fields(input_fields, fake_data)
robot.find_next_or_submit_button.click
