from django.conf.urls import url
from django.views.generic import TemplateView
from . import views

urlpatterns = [
url(r'^add/team$',views.TeamListViewSet.as_view(),name='team_add'),
url(r'^add/player$',views.PlayerListViewSet.as_view(),name='player_add'),
url(r'^playerlist/by/team/(?P<team_id>[\w-]+)/$',views.PlayerListByTeam.as_view(),name='playerlist_by_team'),

url(r'^create/match$',views.MatchCreateViewSet.as_view(),name='match_add'),
url(r'^allmatchlist$',views.MatchCreateViewSet.as_view(),name='matches_list'),

url(r'^match/points/winner/add$',views.CreatPointWinnerMatches.as_view(),name='match_points_winners_add'),
url(r'^winner/points/match$',views.CreatPointWinnerMatches.as_view(),name='list_match_winner_points')


]

