# the concrete component we would like to decorate, a car in our example
class BasicShifted
    def initialize(cost, firm)
        @cost = cost
        @firm = firm
        @description = "basic checkup"
    end

    # getter method
    def cost
        return @cost
    end

    # a method which returns a string representation of the object of type BasicShift
    def details
        return @description + "; " + @firm  + ": " + "#{@cost}"
    end

    # getter method
    def firm
        return @firm
    end

end # ends the BasicShift class



# decorator class -- this serves as the superclass for all the concrete decorators
# the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration
class ShiftedDecorator < BasicShifted
    def initialize(basic_shifted)
        #basic_shift is a real car, i.e. the component we want to decorate
        @basic_shifted = basic_shifted
        super(@basic_shifted.cost, @basic_shifted.firm)
        @extra_cost = 0
        @description = "no extra feature"
    end

    # override the cost method to include the cost of the extra feature
    def cost
        return @extra_cost + @basic_shifted.cost
    end

    # override the details method to include the description of the extra feature
    def details
        return  @description + ": " + "#{@extra_cost}" + ". " + @basic_shifted.details
    end

end # ends the CarDecorator class


# a concrete decorator --  define an extra feature

class BloodtestDecorator < ShiftedDecorator
    def initialize(basic_shifted)
        super(basic_shifted)
        @extra_cost = 30
        @description = "Blood test"
    end

end # ends the BloodtestDecorator class

# another concrete decorator -- define an extra feature
class XrayDecorator < ShiftedDecorator
    def initialize(basic_shifted)
        super(basic_shifted)
        @extra_cost = 50
        @description = "Xray"
    end

end # ends the XrayDecorator class

class CtscanDecorator < ShiftedDecorator
    def initialize(basic_shifted)
        super(basic_shifted)
        @extra_cost = 100
        @description = "CT scan"
    end

end # ends the CtscanDecorator class


class EndoscopyDecorator < ShiftedDecorator
    def initialize(basic_shifted)
        super(basic_shifted)
        @extra_cost = 80
        @description = "endoscopy"
    end

end # ends the EndoscopyDecorator class
