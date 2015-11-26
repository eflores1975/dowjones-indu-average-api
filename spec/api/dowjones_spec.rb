require 'rails_helper'

describe "Dow Jones Api" do
	fixtures :dowjonesindustrial

	it "should test all elements of the array " do
		get "/api/v1/dowjones"
		expect(response).to be_success
		expect_json_types('*', id: :integer, symbl: :string, coname: :string, 
											price: :string, change: :string, changepct: :string, volume: :integer, changeytd: :string, lastupdate: :date)
	end

	it "should throw an exception when an invalid symbol is used" do
		get "/api/v1/dowjones/ZZZ"
		expect_status("404")
		expect_json(error: "Couldn't find DowJonesInduAverageIndex with stock ticker ZZZ")
	end

	it "should validate values" do
		get "/api/v1/dowjones/AXP"
		expect(response).to be_success
		prev_day = Time.new - 1.days
		next_day = Time.new + 1.days
		expect_json(id: 2, symbl: "AXP", coname: "American Express", 
								price: "73.93", change: "-0.14", changepct: "-0.19",
							 	volume: 4983712, changeytd: "20.54", lastupdate: date { |value| expect(value).to be_between(prev_day, next_day) })
	end
end
