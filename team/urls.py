from django.conf.urls import url
from django.views.generic import TemplateView
from . import views

urlpatterns = [
url(r'^team/create$',views.TeamListViewSet.as_view(),name='cerate_team'),

]

