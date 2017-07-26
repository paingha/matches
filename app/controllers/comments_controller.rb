<%= render 'header' %>

<div class="tp-dashboard-head"><!-- page header -->
  <div class="container">
    <div class="row">
      <div class="col-md-12 profile-header">
        <div class="profile-pic col-md-2"><img src="/images/profile-dashbaord.png" alt=""></div>
        <div class="profile-info col-md-9">
          <h1 class="profile-title">Paingha Alagoa<% if current_user.admin == true %><small>Admin</small><% end %></h1>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- /.page header -->
<div class="tp-dashboard-nav">
  <div class="container">
    <div class="row">
      <div class="col-md-12 dashboard-nav">
        <ul class="nav nav-pills nav-justified">
          <li><a href="/profile/#@current_user.username"><i class="fa fa-dashboard db-icon"></i>My Dashboard</a></li>
          <li ><a href="dashboard-profile.html"><i class="fa fa-user db-icon"></i>My Profile</a></li>
          <% if current_user.admin != true %><li><a href="dashboard-my-listing.html"><i class="fa fa-star db-icon"></i>My Favorites </a></li><% end %>
          <% if current_user.admin == true %><li><a href="dashboard-add-listing.html"><i class="fa fa-plus-square db-icon"></i>Add Location</a></li><% end %>
          <% if current_user.admin == true %><li><a href="dashboard-add-listing.html"><i class="fa fa-plus-square db-icon"></i>Add Category</a></li><% end %>
          <% if current_user.admin == true %><li><a href="dashboard-add-listing.html"><i class="fa fa-plus-square db-icon"></i>Add Listing</a></li><% end %>
          <% if current_user.admin == true %><li class="active"><a href="/blogs/new"><i class="fa fa-plus-square db-icon"></i>Add Blog Post</a></li><% end %>
          <% if current_user.admin != true %><li><a href="dashboard-pricing.html"><i class="fa fa-list-alt db-icon"></i>Subscriptions</a></li><% end %>
          
          <li><a href="dashboard-pricing.html"><i class="fa fa-cog db-icon"></i>Settings</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div class="main-container">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="dashboard-page-head">
          <div class="page-header">
            <h1>Add New Category</h1>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="container">
    <div class="row">
     <div class="col-md-2"></div>
      <div class="col-md-8 add-listing-dashboard">
        <div class="row">
          <div class="col-md-12 dashboard-form">
            <div class="bg-white pinside40 mb30">
		
		          
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-2"></div>
    </div>
  </div>
</div>



 <div>

</div>
<div>

</div>

<%= render 'footer' %>