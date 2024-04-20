from robot.api.deco import library, keyword


@library
class custom1():
    # def __init__(self):

    @keyword
    def hello_world(self):
        print("Hello binay custom message")

    @keyword
    def h(self):
        print("hi")

