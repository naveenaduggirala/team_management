from rest_framework import serializers
from .models import *

class TeamSerializer(serializers.Serializer):
	name = serializers.CharField(max_length=100)
	club_state = serializers.CharField(max_length=100)