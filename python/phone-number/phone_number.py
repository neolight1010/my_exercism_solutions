class PhoneNumber:
    def __init__(self, number: str):
        self.number = PhoneNumber.clean_number(number)
        self.area_code = self.number[0:3]


    @staticmethod
    def clean_number(number: str) -> str:
        """
        Cleans a PhoneNumber string and returns it. Raises a 
        ValueError if the number is invalid
        """
        # Clean punctuation
        clean = "".join([d for d in number if d.isdigit()])
        
        # Validate number
        if len(clean) != 10 and len(clean) != 11:
            raise ValueError("Number must have 10 digits or 11 digits (with country code 1.)")
        
        if len(clean) == 11:
            if int(clean[0]) != 1:
                raise ValueError("If country code is included, it must be 1.")

            clean = clean[1:]

        # Check N digits
        if int(clean[0]) < 2 or int(clean[3]) < 2:
            raise ValueError("Invalid number.")

        return clean


    def pretty(self) -> str:
        return f"({self.area_code})-{self.number[3:6]}-{self.number[6:]}"
