<?php
require_once 'common/header.php';
?>
<!-- Dashboard Wrapper starts -->
<div class="dashboard-wrapper"> 

    <!-- Top Bar starts -->
    <div class="top-bar">
        <div class="page-title"> Edit User</div>
    </div>
    <!-- Top Bar ends --> 

    <!-- Main Container starts -->
    <div class="main-container"> 

        <!-- Container fluid Starts -->
        <div class="container-fluid"> 

            <!-- Spacer starts -->
            <div class="spacer"> 
                <?php include 'common/message_panel.php'; ?>
                <?php include 'common/error_panel.php'; ?>
                <!-- Row Starts -->
                <div class="row">
                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                        <div class="blog">
                            <div class="blog-body">
                                <form id="defaultForm" method="post" action="index.php" 
                                      class="form-horizontal"  enctype="multipart/form-data">
                                    <input type="hidden" name="action" value="user_edit_save">
                                    <input type="hidden" name="user_id" value="<?=$row['user_id']?>"/>
                                    <fieldset>
                                        <legend>User Information</legend>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Name</label>
                                            <div class="col-lg-9">
                                                <input type="text" class="form-control" name="name" 
                                                       value="<?= $row['name']?>" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Lab Name</label>
                                            <div class="col-lg-9">
                                                <select name="lab_id" id="lab_id" class="form-control">
                                                    <?php foreach ($lab_name as $labname): ?>
                                                        <option value="<?= $labname['lab_id']?>"><?= $labname['dashboard_value']?></option>
                                                    <?php endforeach;?>
                                                </select>
                                            </div>
                                        </div>
										<div class="form-group">
                                            <label class="col-lg-3 control-label">User Name</label>
                                            <div class="col-lg-9">
                                                <input type="text" class="form-control" name="username" 
                                                       value="<?= $row['username']?>" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Password</label>
                                            <div class="col-lg-9">
                                                <input type="text" class="form-control" name="password"
                                                        value="<?= $row['password']?>"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Phone</label>
                                            <div class="col-lg-9">
                                                <input type="tel" pattern="^[0-9\-\+\s\(\)]*$" class="form-control" name="phone"
                                                        value="<?= $row['phone']?>"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-3 control-label">Email</label>
                                            <div class="col-lg-9">
                                                <input type="text" class="form-control" name="email"
                                                        value="<?= $row['email']?>"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-6 control-label">Gender</label>
                                            <div class="col-lg-6">
                                                <label class="radio-inline">
                                                    <input type="radio" name="gender" value="1" checked="true"> Male
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="gender" value="0"> Female
                                                </label>
                                            </div>
                                        </div>
                                    <div class="form-group">
                                        <div class="col-lg-6 col-lg-offset-6">
                                            <button type="submit" class="btn btn-success">Update</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Row Ends --> 

        </div>
        <!-- Spacer ends --> 

    </div>
    <!-- Container fluid ends -->

</div> 

<?php
require_once 'common/footer.php';
?>