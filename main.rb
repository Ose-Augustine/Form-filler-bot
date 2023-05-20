require "selenium-webdriver"
require "rubygems" 
require 'webdrivers'


def bot

    options = Selenium::WebDriver::Edge::Options.new(args:['headless'])

    driver = Selenium::WebDriver.for(:edge, options: options)

    driver.navigate.to "https://docs.google.com/forms/d/e/1FAIpQLScRWyqpgDXKHu6pV1wEhewUIEnrHiiTnvQFgJ8SLtiGx7EebQ/viewform"
    wait = Selenium::WebDriver::Wait.new(timeout: 100)

    # All questions have the same class_name
    questions = driver.find_elements(:class_name, "M7eMe")
    input_fields = wait.until {driver.find_elements(:css, ".whsOnd.zHQkBf")}
    radio_labels = wait.until {driver.find_elements(:css, ".docssharedWizToggleLabeledContainer.ajBQVb")}
    submit_button = driver.find_elements(:css, ".uArJ5e.UQuaGc.Y5sE8d.VkkpIf.QvWxOd")
    title = driver.title

    input_fields[0].send_keys "jamie lannister"
    radio_labels[0].click
    submit_button[0].click 

    p input_fields.length 
    p radio_labels.length 
    p submit_button.length

    driver.quit


end 

bot()