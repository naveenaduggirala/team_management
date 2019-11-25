from django.db import models

# Create your models here.
class Team(models.Model):
	name = models.CharField(max_length=100,blank=True,null=True,unique=True)
	logo = models.ImageField(upload_to='Team',blank=True,null=True)
	club_state = models.CharField(max_length=100,blank=True,null=True)

	def __str__(self):
		return '%s' % self.name


class Player(models.Model):
	firstname = models.CharField(max_length=100,blank=True,null=True)
	lastname = models.CharField(max_length=100,blank=True,null=True)
	image = models.ImageField(upload_to='Player',blank=True,null=True)
	player_jersey_no = models.CharField(max_length=100,blank=True,null=True)
	country	= models.CharField(max_length=100,blank=True,null=True)
	player_history = models.CharField(max_length=100,blank=True,null=True)
	player_team = models.ForeignKey(Team, blank=True, null=True)


	def __str__(self):
		return '%s' % self.firstname