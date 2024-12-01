from django.urls import path
from . import views

urlpatterns = [
    path('', views.employee_list, name='employee_list'),
    path('create/', views.employee_create, name='employee_create'),
    path('<int:id>/edit/', views.employee_edit, name='employee_edit'),
    path('<int:id>/delete/', views.employee_delete, name='employee_delete'),
]

