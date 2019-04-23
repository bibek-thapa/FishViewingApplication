
describe("FishData",function()
{
	it("checks if the input is string only",function()
	{
		expect(Fish.cleanNumber("123 34-5")).toEqual("12345")
	});


});