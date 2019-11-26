from rest_framework.views import APIView 
from rest_framework.response import Response 
from rest_framework import status 
from .models import *
from .serializers import *
from django.shortcuts import get_list_or_404, get_object_or_404
from django.http import Http404, HttpResponse, HttpResponseRedirect, HttpResponseForbidden
from django.db import IntegrityError
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
import json

class TeamListViewSet(APIView):
	def get(self, request, format=None):
		team_list = Team.objects.values('id','name','logo','club_state')
		context_data = {"success":True,"data":team_list}
		return Response(context_data)

	@method_decorator(csrf_exempt)
	def post(self, request,format=None):
		serializer = TeamSerializer(data=json.loads(request.data['data']))
		team_obj = json.loads(request.data['data'])
		context_data = {}
		if serializer.is_valid():
			try:
				team_form = {
				"name": team_obj['name'],
				"club_state": team_obj['club_state']              
				}

				if 'image' in request.data:
					if request.data['image']:
						team_form.update({"logo" : request.data['image']})
					try:
						Team.objects.create(**team_form)
						context_data = {"success" : True,"message" : "Team Created Successfully"}
					except Exception as e:
						context_data = {"success" : False,"errors" : {"message":str(e)}}
			except Exception as e:
				context_data = {"success" : False, "errors" : {"message":str(e)}}
		else:
			context_data = {"success" : False, "errors" : {"message": "Validation Error" ,  "errors_list" : serializer.errors}}            
		return Response(context_data)

class PlayerListViewSet(APIView):
	def post(self,request,format=None):
		serializer = PlayerSerializer(data=json.loads(request.data['data']))
		player_obj = json.loads(request.data['data'])
		if serializer.is_valid():
			try:
				team_obj = Team.objects.get(pk=player_obj['team_id'])
			except Team.DoesNotExist as e:
				context_data = {"success" : False, "errors" : {"message":"Team does not exist"}}

			player_form = {
			"firstname":player_obj['firstname'],
			"lastname":player_obj['lastname'],
			"image":request.data['image'],
			"player_jersey_no":player_obj['jersey_no'],
			"country":player_obj['country'],
			"player_team":team_obj
			}	

			try:
				Player.objects.create(**player_form)
				context_data = {"success" : True,"message" : "Player Created Successfully"}
			except Exception as e:
				context_data ={"success":False,"errors":{"message":str(e)}}
		else:
			context_data = {"success":False, "errors" : {"message": "Validation Error" ,  "errors_list" : serializer.errors}}
		return Response(context_data)

class PlayerListByTeam(APIView):
	def get(self,request,format=None,team_id=None):
		try:
			team_obj = Team.objects.get(pk=team_id)
		except Team.DoesNotExist as e:
			context_data = {"success" : False, "errors" : {"message":"Team does not exist"}}
		player_list = Player.objects.filter(player_team=team_obj).values('firstname','lastname','image','player_jersey_no','country')
		context_data = {"success":True,"data":player_list}
		return Response(context_data)

class MatchCreateViewSet(APIView):
	def get(self,request,format=None):
		match_list = []
		for each in Matches.objects.all():
			team1 = str(each.contestant1.name)
			team2 = str(each.contestant2.name)
			match_obj ={
			"match_id":each.pk,
			"contestant1":each.contestant1.name,
			"contestant2":each.contestant2.name,
			"match":"{} vs {}".format(team1.title(),team2.title())
			}
			match_list.append(match_obj)
		context_data = {"success":True,"data":match_list}
		return Response(context_data)

	def post(self,request,format=None):
		serializer = MatchCreateSerializer(data=request.data)
		if serializer.is_valid():
			try:
				team1_obj = Team.objects.get(pk=request.data['contestant1'])
			except Team.DoesNotExist as e:
				context_data = {"success" : False, "errors" : {"message":"Team does not exist"}}

			try:
				team2_obj = Team.objects.get(pk=request.data['contestant2'])
			except Team.DoesNotExist as e:
				context_data = {"success" : False, "errors" : {"message":"Team does not exist"}}

			match_form = {
			"contestant1" : team1_obj,
			"contestant2" : team2_obj
			}

			try:
				Matches.objects.create(**match_form)
				context_data = {"success" : True,"message" : "Match Created Successfully for {} and {}".format(team1_obj.name,team2_obj.name)}
			except Exception as e:
				context_data = {"success" : False, "errors" : {"message":str(e)}}
		else:
			context_data = {"success" : False, "errors" : {"message": serializer.errors}}

		return Response(context_data)


class CreatPointWinnerMatches(APIView):
	def get(self,request,format=None):
		match_points_list = Points.objects.values("match__contestant1__name","match__contestant1__name","winner","contestant1_points","contestant2_points")
		context_data ={"success":True,"data":match_points_list}
		return Response(context_data)

	def post(self,request,format=None):
		serializers = CreatPointsWinnerSerializer(data=request.data)
		if serializers.is_valid():
			try:
				match_obj = Matches.objects.get(pk=request.data['match_id'])	
			except Matches.DoesNotExist as e:
				context_data = {"success" : False, "errors" : {"message":"Matches does not exist"}}

			winner_form = {
			"match":match_obj,
			"winner":request.data['winner'],
			"contestant1_points":request.data['contestant1_points'],
			"contestant2_points":request.data['contestant2_points']
			}
			try:
				Points.objects.create(**winner_form)
				context_data = {"success" : True,"message" : "Points and Winner Recorded Successfully"}
			except Exception as e:
				context_data = {"success" : False, "errors" : {"message":str(e)}}
		else:
			context_data = {"success" : False, "errors" : {"message":serializer.errors}}
		return Response(context_data)







