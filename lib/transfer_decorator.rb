# the concrete component we would like to decorate, a car in our example
class BasicTransfer
    def initialize(c,f, d, age)
        @cost = c
        @firm = f
        @date = d
        @age = age
        @detail = "basic transfer"
    end

    # getter method
    def cost
        return @cost
    end

    # a method which returns a string representation of the object of type BasicDrug
    def descriptions
        return @detail + "; " + @firm +"; " + @date + "; " + @age + ": " + "#{@cost}"
    end

    # getter method
    def age
        return @age
    end

    # getter method
    def date
        return @date
    end

    def firm
        return @firm
    end

end # ends the BasicDrug class



# decorator class -- this serves as the superclass for all the concrete decorators
# the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration
class TransferDecorator < BasicTransfer
    def initialize(basic_transfer)
        #basic_transfer is a real car, i.e. the component we want to decorate
        @basic_transfer = basic_transfer
        super(@basic_transfer.cost, @basic_transfer.firm,@basic_transfer.date, @basic_transfer.age)
        @extra_cost = 0
        @detail = "no extra transfer"
    end

    # override the cost method to include the cost of the extra feature
    def cost
        return @extra_cost + @basic_transfer.cost
    end

    # override the details method to include the detail of the extra feature
    def descriptions

        return  @detail + ": " + "#{@extra_cost}" + ". " + @basic_transfer.descriptions
    end

end # ends the CarDecorator class


# a concrete decorator --  define an extra feature


# another concrete decorator -- define an extra feature
class HospitalDecorator < TransferDecorator
    def initialize(basic_transfer)
        super(basic_transfer)
        @extra_cost = 0
        @detail = "Hospital Transfer"
    end

end # ends the ElectricWindowsDecorator class
