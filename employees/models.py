from django.db import models

class Employee(models.Model):
    id = models.AutoField(primary_key=True)
    empname = models.CharField(max_length=100)
    mobile = models.CharField(max_length=15)
    salary = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return self.empname

