class Person:
    def info(self, num):
        for i in range(1,10):
            num+=1
        print(num,end='')
        
class Student(Person):
    def info(self, num):
        super().info(num)
        print(num, end='')

a=Student()
a.info(30)
