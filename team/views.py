from rest_framework.views import APIView 
from rest_framework.response import Response 
from rest_framework import status 
from .models import *
from .serializers import *
from django.shortcuts import get_list_or_404, get_object_or_404
from django.http import Http404, HttpResponse, HttpResponseRedirect, HttpResponseForbidden
from django.db import IntegrityError



class TeamListViewSet(APIView):
		def get(self, request, format=None):
			print "hi"
			team_obj_list = Team.objects.all()
			print team_obj_list,'team_obj_list'
			team_list = team_obj_list.values('name','logo','club_state')
			print team_list,"team_list"
			context_data = {"success":True,"data":team_list}
			return Response(context_data)


		def post(self, request,format=None):
				serializer = TeamSerializer(data=request.data)
				if serializer.is_valid():
						try:
								team_form = {
														"name": request.data['name'],
														"club_state": request.data['club_state']              
														}

								if 'logo' in request.data:
										if request.data['logo']:
												team_form.update({"logo" : request.data['logo']})
								
								try:
										Team.objects.create(**team_form)
										context_data = {"success" : True,"message" : "Record Created Successfully"}
								except IntegrityError as e:
										# print (e)
										context_data = {"success" : False,"errors" : {"message":str(e)}}
						except Exception as e:
							context_data = {"success" : False, "errors" : {"message":str(e)}}
				else:
						context_data = {"success" : False, "errors" : {"message": "Validation Error" ,  "errors_list" : serializer.errors}}            
				return Response(context_data)