from rest_framework import serializers
from .models import *

class TeamSerializer(serializers.Serializer):
	name = serializers.CharField(max_length=100)
	club_state = serializers.CharField(max_length=100)

class PlayerSerializer(serializers.Serializer):
	firstname = serializers.CharField(max_length=100)
	lastname = serializers.CharField(max_length=100)
	jersey_no = serializers.CharField(max_length=100)
	country = serializers.CharField(max_length=100)
	team_id = serializers.CharField()

class MatchCreateSerializer(serializers.Serializer):
	contestant1 = serializers.CharField()
	contestant2 = serializers.CharField()

class CreatPointsWinnerSerializer(serializers.Serializer):
	match_id = serializers.CharField()
	winner = serializers.CharField()
	contestant1_points = serializers.CharField()
	contestant2_points = serializers.CharField()