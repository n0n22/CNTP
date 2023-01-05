<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
<style>

    body{margin-top:20px;
        background:#F5F5F5;
        }
        /* Candidate List */
        .candidate-list {
          background: #ffffff;
          display: -webkit-box;
          display: -ms-flexbox;
          display: flex;
          border-bottom: 1px solid #eeeeee;
          -webkit-box-align: center;
              -ms-flex-align: center;
                  align-items: center;
          padding: 20px;
          -webkit-transition: all 0.3s ease-in-out;
          transition: all 0.3s ease-in-out; }
          .candidate-list:hover {
            -webkit-box-shadow: 0px 0px 34px 4px rgba(33, 37, 41, 0.06);
                    box-shadow: 0px 0px 34px 4px rgba(33, 37, 41, 0.06);
            position: relative;
            z-index: 99; }
            .candidate-list:hover a.candidate-list-favourite {
              color: #e74c3c;
              -webkit-box-shadow: -1px 4px 10px 1px rgba(24, 111, 201, 0.1);
                      box-shadow: -1px 4px 10px 1px rgba(24, 111, 201, 0.1); }
        
        .candidate-list .candidate-list-image {
          margin-right: 25px;
          -webkit-box-flex: 0;
              -ms-flex: 0 0 80px;
                  flex: 0 0 80px;
          border: none; }
          .candidate-list .candidate-list-image img {
            width: 80px;
            height: 80px;
            -o-object-fit: cover;
               object-fit: cover; }
        
        .candidate-list-title {
          margin-bottom: 5px; }
        
        .candidate-list-details ul {
          display: -webkit-box;
          display: -ms-flexbox;
          display: flex;
          -ms-flex-wrap: wrap;
              flex-wrap: wrap;
          margin-bottom: 0px; }
          .candidate-list-details ul li {
            margin: 5px 10px 5px 0px;
            font-size: 13px; }
        
        .candidate-list .candidate-list-favourite-time {
          margin-left: auto;
          text-align: center;
          font-size: 13px;
          -webkit-box-flex: 0;
              -ms-flex: 0 0 90px;
                  flex: 0 0 90px; }
          .candidate-list .candidate-list-favourite-time span {
            display: block;
            margin: 0 auto; }
          .candidate-list .candidate-list-favourite-time .candidate-list-favourite {
            display: inline-block;
            position: relative;
            height: 40px;
            width: 40px;
            line-height: 40px;
            border: 1px solid #eeeeee;
            border-radius: 100%;
            text-align: center;
            -webkit-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
            margin-bottom: 20px;
            font-size: 16px;
            color: #646f79;
            }
            .candidate-list .candidate-list-favourite-time .candidate-list-favourite:hover {
              background: #ffffff;
              color: #e74c3c; }
        
        .candidate-banner .candidate-list:hover {
          position: inherit;
          -webkit-box-shadow: inherit;
                  box-shadow: inherit;
          z-index: inherit; }
        
        
        /* Candidate Grid */
        .candidate-list.candidate-grid {
            padding: 0px;
            display: block;
            border-bottom: none;
        }
        
        .candidate-grid .candidate-list-image {
            text-align: center;
            margin-right: 0px;
        }
        .candidate-grid .candidate-list-image img {
            height: 150px;
            width: 100%;
        }
        
        .candidate-grid .candidate-list-details {
            text-align: center;
            padding: 20px 20px 0px 20px;
            border: 1px solid #eeeeee;
            border-top: none;
        }
        .candidate-grid .candidate-list-details ul {
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
        }
        .candidate-grid .candidate-list-details ul li {
            margin: 2px 5px;
        }
        
        .candidate-grid .candidate-list-favourite-time {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            border-top: 1px solid #eeeeee;
            margin-top: 10px;
            padding: 10px 0;
        }
        .candidate-grid .candidate-list-favourite-time a {
            margin-bottom: 0;
            margin-left: auto;
        }
        .candidate-grid .candidate-list-favourite-time span {
            display: inline-block;
            margin: 0;
            -ms-flex-item-align: center;
            align-self: center;
        }
        
        .candidate-list.candidate-grid .candidate-list-favourite-time .candidate-list-favourite {
            margin-bottom: 0px;
        }
        
        .owl-carousel .candidate-list.candidate-grid {
            margin-bottom: 20px;
        }
        
        
        /* Widget */
        .widget .widget-title {
            margin-bottom: 20px;
        }
        .widget .widget-title h6 {
            margin-bottom: 0;
        }
        .widget .widget-title a {
            color: #212529;
        }
        
        .widget .widget-collapse {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            margin-bottom: 0;
        }
        
        /* similar-jobs-item */
        .similar-jobs-item .job-list {
            border-bottom: 0;
            padding: 0;
            margin-bottom: 15px;
        }
        .similar-jobs-item .job-list:last-child {
            margin-bottom: 0;
        }
        .similar-jobs-item .job-list:hover {
            -webkit-box-shadow: none;
            box-shadow: none;
        }
        
        /* checkbox */
        .widget .widget-content {
            margin-top: 10px;
        }
        .widget .widget-content .custom-checkbox {
            margin-bottom: 8px;
        }
        .widget .widget-content .custom-checkbox:last-child {
            margin-bottom: 0px;
        }
        
        .widget .custom-checkbox.fulltime-job .custom-control-label:before {
            background-color: #186fc9;
            border: 2px solid #186fc9;
        }
        
        .widget .custom-checkbox.fulltime-job .custom-control-input:checked ~ .custom-control-label:before {
            background: #186fc9;
            border-color: #186fc9;
        }
        
        .widget .custom-checkbox.parttime-job .custom-control-label:before {
            background-color: #ffc107;
            border: 2px solid #ffc107;
        }
        
        .widget .custom-checkbox.parttime-job .custom-control-input:checked ~ .custom-control-label:before {
            background: #ffc107;
            border-color: #ffc107;
        }
        
        .widget .custom-checkbox.freelance-job .custom-control-label:before {
            background-color: #53b427;
            border: 2px solid #53b427;
        }
        
        .widget .custom-checkbox.freelance-job .custom-control-input:checked ~ .custom-control-label:before {
            background: #53b427;
            border-color: #53b427;
        }
        
        .widget .custom-checkbox.temporary-job .custom-control-label:before {
            background-color: #e74c3c;
            border: 2px solid #e74c3c;
        }
        
        .widget .custom-checkbox.temporary-job .custom-control-input:checked ~ .custom-control-label:before {
            background: #e74c3c;
            border-color: #e74c3c;
        }
        
        .widget ul {
            margin: 0;
        }
        .widget ul li a:hover {
            color: #21c87a;
        }
        
        .widget .company-detail-meta ul {
            display: block;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
        }
        .widget .company-detail-meta ul li {
            margin-right: 15px;
            display: inline-block;
        }
        .widget .company-detail-meta ul li a {
            color: #646f79;
            font-weight: 600;
            font-size: 12px;
        }
        
        .widget .company-detail-meta .share-box li {
            margin-right: 0;
            display: inline-block;
            float: left;
        }
        
        .widget .company-detail-meta ul li.linkedin a {
            padding: 15px 20px;
            border: 2px solid #eeeeee;
            display: inline-block;
        }
        .widget .company-detail-meta ul li.linkedin a i {
            color: #06cdff;
        }
        
        .widget .company-address ul li {
            margin-bottom: 10px;
        }
        .widget .company-address ul li:last-child {
            margin-bottom: 0;
        }
        .widget .company-address ul li a {
            color: #646f79;
        }
        
        .widget .widget-box {
            padding: 20px 15px;
        }
        
        .widget .similar-jobs-item .job-list.jobster-list {
            padding: 15px 10px;
            border: 0;
            margin-bottom: 10px;
        }
        
        .widget .similar-jobs-item .job-list {
            padding-bottom: 15px;
        }
        
        .widget .similar-jobs-item .job-list-logo {
            margin-left: auto;
            -webkit-box-flex: 0;
            -ms-flex: 0 0 60px;
            flex: 0 0 60px;
            height: 60px;
            width: 60px;
        }
        
        .widget .similar-jobs-item .job-list-details {
            margin-right: 15px;
            -ms-flex-item-align: center;
            align-self: center;
        }
        .widget .similar-jobs-item .job-list-details .job-list-title h6 {
            margin-bottom: 0;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .widget .similar-jobs-item .job-list.jobster-list .job-list-company-name {
            color: #21c87a;
        }
        
        .widget .docs-content {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            background: #eeeeee;
            padding: 30px;
            border-radius: 3px;
        }
        .widget .docs-content .docs-text {
            -ms-flex-item-align: center;
            align-self: center;
            color: #646f79;
        }
        .widget .docs-content span {
            font-weight: 600;
        }
        .widget .docs-content .docs-icon {
            margin-left: auto;
            -webkit-box-flex: 0;
            -ms-flex: 0 0 38px;
            flex: 0 0 38px;
        }
        
        /* Job Detail */
        .widget .jobster-company-view ul li {
            border: 1px solid #eeeeee;
            margin-bottom: 20px;
        }
        .widget .jobster-company-view ul li:last-child {
            margin-bottom: 0;
        }
        .widget .jobster-company-view ul li span {
            color: #212529;
            -ms-flex-item-align: center;
            align-self: center;
            font-weight: 600;
        }
        
        .sidebar .widget {
            border: 1px solid #eeeeee;
            margin-bottom: 30px;
        }
        .sidebar .widget .widget-title {
            border-bottom: 1px solid #eeeeee;
            padding: 14px 20px;
        }
        
        .sidebar .widget .widget-content {
            padding: 14px 20px;
        }
        .widget .widget-content {
            margin-top: 10px;
        }
</style>
</head>
<body>
    <div class="outer">
        <div class="row">
            <div class="col-lg-3">
                <div class="sidebar">
                    <div class="widget border-0">
                        <div class="search">
                            <input class="form-control" type="text" placeholder="Search Keywords">
                        </div>
                    </div>
                    <div class="widget border-0">
                        <div class="locations">
                            <input class="form-control" type="text" placeholder="All Locations">
                        </div>
                    </div>
                    <div class="widget">
                        <div class="widget-title widget-collapse">
                            <h6>Date Posted</h6>
                            <a class="ml-auto" data-toggle="collapse" href="#dateposted" role="button" aria-expanded="false" aria-controls="dateposted"> <i class="fas fa-chevron-down"></i> </a>
                        </div>
                        <div class="collapse show" id="dateposted">
                            <div class="widget-content">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="dateposted1">
                                    <label class="custom-control-label" for="dateposted1">Last hour</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="dateposted2">
                                    <label class="custom-control-label" for="dateposted2">Last 24 hour</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="dateposted3">
                                    <label class="custom-control-label" for="dateposted3">Last 7 days</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="dateposted4">
                                    <label class="custom-control-label" for="dateposted4">Last 14 days</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="dateposted5">
                                    <label class="custom-control-label" for="dateposted5">Last 30 days</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget">
                        <div class="widget-title widget-collapse">
                            <h6>Specialism</h6>
                            <a class="ml-auto" data-toggle="collapse" href="#specialism" role="button" aria-expanded="false" aria-controls="specialism"> <i class="fas fa-chevron-down"></i> </a>
                        </div>
                        <div class="collapse show" id="specialism">
                            <div class="widget-content">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="specialism1">
                                    <label class="custom-control-label" for="specialism1">IT Contractor</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="specialism2">
                                    <label class="custom-control-label" for="specialism2">Clinical Psychology</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="specialism3">
                                    <label class="custom-control-label" for="specialism3">Digital &amp; Creative</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="specialism4">
                                    <label class="custom-control-label" for="specialism4">Estate Agency</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="specialism5">
                                    <label class="custom-control-label" for="specialism5">Graduate</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget">
                        <div class="widget-title widget-collapse">
                            <h6>Job Type</h6>
                            <a class="ml-auto" data-toggle="collapse" href="#jobtype" role="button" aria-expanded="false" aria-controls="jobtype"> <i class="fas fa-chevron-down"></i> </a>
                        </div>
                        <div class="collapse show" id="jobtype">
                            <div class="widget-content">
                                <div class="custom-control custom-checkbox fulltime-job">
                                    <input type="checkbox" class="custom-control-input" id="jobtype1">
                                    <label class="custom-control-label" for="jobtype1">Full Time</label>
                                </div>
                                <div class="custom-control custom-checkbox parttime-job">
                                    <input type="checkbox" class="custom-control-input" id="jobtype2">
                                    <label class="custom-control-label" for="jobtype2">Part-Time</label>
                                </div>
                                <div class="custom-control custom-checkbox freelance-job">
                                    <input type="checkbox" class="custom-control-input" id="jobtype3">
                                    <label class="custom-control-label" for="jobtype3">Freelance</label>
                                </div>
                                <div class="custom-control custom-checkbox temporary-job">
                                    <input type="checkbox" class="custom-control-input" id="jobtype4">
                                    <label class="custom-control-label" for="jobtype4">Temporary</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget">
                        <div class="widget-title widget-collapse">
                            <h6>Experience</h6>
                            <a class="ml-auto" data-toggle="collapse" href="#experience" role="button" aria-expanded="false" aria-controls="experience"> <i class="fas fa-chevron-down"></i> </a>
                        </div>
                        <div class="collapse show" id="experience">
                            <div class="widget-content">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="experience1">
                                    <label class="custom-control-label" for="experience1">fresher</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="experience2">
                                    <label class="custom-control-label" for="experience2">Less than 1 year</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="experience3">
                                    <label class="custom-control-label" for="experience3">2 Year</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="experience4">
                                    <label class="custom-control-label" for="experience4">3 Year</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="experience5">
                                    <label class="custom-control-label" for="experience5">4 Year</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget">
                        <div class="widget-title widget-collapse">
                            <h6>Offered Salary</h6>
                            <a class="ml-auto" data-toggle="collapse" href="#Offeredsalary" role="button" aria-expanded="false" aria-controls="Offeredsalary"> <i class="fas fa-chevron-down"></i> </a>
                        </div>
                        <div class="collapse show" id="Offeredsalary">
                            <div class="widget-content">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Offeredsalary1">
                                    <label class="custom-control-label" for="Offeredsalary1">10k - 20k</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Offeredsalary2">
                                    <label class="custom-control-label" for="Offeredsalary2">20k - 30k</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Offeredsalary3">
                                    <label class="custom-control-label" for="Offeredsalary3">30k - 40k</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Offeredsalary4">
                                    <label class="custom-control-label" for="Offeredsalary4">40k - 50k</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Offeredsalary5">
                                    <label class="custom-control-label" for="Offeredsalary5">50k - 60k</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget">
                        <div class="widget-title widget-collapse">
                            <h6>Gender</h6>
                            <a class="ml-auto" data-toggle="collapse" href="#gender" role="button" aria-expanded="false" aria-controls="gender"><i class="fas fa-chevron-down"></i></a>
                        </div>
                        <div class="collapse show" id="gender">
                            <div class="widget-content">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="gender1">
                                    <label class="custom-control-label" for="gender1">Male</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="gender2">
                                    <label class="custom-control-label" for="gender2">Female</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget">
                        <div class="widget-title widget-collapse">
                            <h6>Qualification</h6>
                            <a class="ml-auto" data-toggle="collapse" href="#qualification" role="button" aria-expanded="false" aria-controls="qualification"> <i class="fas fa-chevron-down"></i></a>
                        </div>
                        <div class="collapse show" id="qualification">
                            <div class="widget-content">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="qualification1">
                                    <label class="custom-control-label" for="qualification1">Matriculation</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="qualification2">
                                    <label class="custom-control-label" for="qualification2">Intermediate</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="qualification3">
                                    <label class="custom-control-label" for="qualification3">Graduate</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget border-0">
                        <div class="widget-add">
                            <img class="img-fluid" src="images/add-banner.png" alt=""></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="row mb-4">
                    <div class="col-12">
                        <h6 class="mb-0">Showing 1-10 of <span class="text-primary">28 Candidates</span></h6>
                    </div>
                </div>
                <div class="job-filter mb-4 d-sm-flex align-items-center">
                    <div class="job-alert-bt"> <a class="btn btn-md btn-dark" href="#"><i class="fa fa-envelope"></i>Get job alert </a> </div>
                    <div class="job-shortby ml-sm-auto d-flex align-items-center">
                        <form class="form-inline">
                            <div class="form-group mb-0">
                                <label class="justify-content-start mr-2">Sort by :</label>
                                <div class="short-by">
                                    <select class="form-control basic-select select2-hidden-accessible" data-select2-id="1" tabindex="-1" aria-hidden="true">
                                        <option data-select2-id="3">Newest</option>
                                        <option>Oldest</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 col-lg-4 mb-4">
                        <div class="candidate-list candidate-grid">
                            <div class="candidate-list-image">
                                <img class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                            </div>
                            <div class="candidate-list-details">
                                <div class="candidate-list-info">
                                    <div class="candidate-list-title">
                                        <h5><a href="candidate-detail.html">Rafael Briggs</a></h5>
                                    </div>
                                    <div class="candidate-list-option">
                                        <ul class="list-unstyled">
                                            <li><i class="fas fa-filter pr-1"></i>Recruitment Consultancy</li>
                                            <li><i class="fas fa-map-marker-alt pr-1"></i>Haines City, FL 33844</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="candidate-list-favourite-time">
                                    <a class="candidate-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                                    <span class="candidate-list-time order-1"><i class="far fa-clock pr-1"></i>1M ago</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-4 mb-4">
                        <div class="candidate-list candidate-grid">
                            <div class="candidate-list-image">
                                <img class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="">
                            </div>
                            <div class="candidate-list-details">
                                <div class="candidate-list-info">
                                    <div class="candidate-list-title">
                                        <h5><a href="candidate-detail.html">Roderick Moss</a></h5>
                                    </div>
                                    <div class="candidate-list-option">
                                        <ul class="list-unstyled">
                                            <li><i class="fas fa-filter pr-1"></i>Information Technology</li>
                                            <li><i class="fas fa-map-marker-alt pr-1"></i>Lynch Lane, Weymouth</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="candidate-list-favourite-time">
                                    <a class="candidate-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                                    <span class="candidate-list-time order-1"><i class="far fa-clock pr-1"></i>3M ago</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-4 mb-4">
                        <div class="candidate-list candidate-grid">
                            <div class="candidate-list-image">
                                <img class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="">
                            </div>
                            <div class="candidate-list-details">
                                <div class="candidate-list-info">
                                    <div class="candidate-list-title">
                                        <h5><a href="candidate-detail.html">Ronald Bradley</a></h5>
                                    </div>
                                    <div class="candidate-list-option">
                                        <ul class="list-unstyled">
                                            <li><i class="fas fa-filter pr-1"></i>Human Resources</li>
                                            <li><i class="fas fa-map-marker-alt pr-1"></i>Monroe Township, NJ 08831</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="candidate-list-favourite-time">
                                    <a class="candidate-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                                    <span class="candidate-list-time order-1"><i class="far fa-clock pr-1"></i>3D ago</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-4 mb-4">
                        <div class="candidate-list candidate-grid">
                            <div class="candidate-list-image">
                                <img class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="">
                            </div>
                            <div class="candidate-list-details">
                                <div class="candidate-list-info">
                                    <div class="candidate-list-title">
                                        <h5><a href="candidate-detail.html">Nichole Haynes</a></h5>
                                    </div>
                                    <div class="candidate-list-option">
                                        <ul class="list-unstyled">
                                            <li><i class="fas fa-filter pr-1"></i>IT Contractor</li>
                                            <li><i class="fas fa-map-marker-alt pr-1"></i>Botchergate, Carlisle</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="candidate-list-favourite-time">
                                    <a class="candidate-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                                    <span class="candidate-list-time order-1"><i class="far fa-clock pr-1"></i>6D ago</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-4 mb-4">
                        <div class="candidate-list candidate-grid">
                            <div class="candidate-list-image">
                                <img class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="">
                            </div>
                            <div class="candidate-list-details">
                                <div class="candidate-list-info">
                                    <div class="candidate-list-title">
                                        <h5><a href="candidate-detail.html">Vickie Meyer</a></h5>
                                    </div>
                                    <div class="candidate-list-option">
                                        <ul class="list-unstyled">
                                            <li><i class="fas fa-filter pr-1"></i>Human Resources</li>
                                            <li><i class="fas fa-map-marker-alt pr-1"></i>Minneapolis, MN 55406</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="candidate-list-favourite-time">
                                    <a class="candidate-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                                    <span class="candidate-list-time order-1"><i class="far fa-clock pr-1"></i>2D ago</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-4 mb-4">
                        <div class="candidate-list candidate-grid">
                            <div class="candidate-list-image">
                                <img class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="">
                            </div>
                            <div class="candidate-list-details">
                                <div class="candidate-list-info">
                                    <div class="candidate-list-title">
                                        <h5><a href="candidate-detail.html">Brooke Kelly</a></h5>
                                    </div>
                                    <div class="candidate-list-option">
                                        <ul class="list-unstyled">
                                            <li><i class="fas fa-filter pr-1"></i>Information Technology</li>
                                            <li><i class="fas fa-map-marker-alt pr-1"></i>Rolling Meadows, IL 60008</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="candidate-list-favourite-time">
                                    <a class="candidate-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                                    <span class="candidate-list-time order-1"><i class="far fa-clock pr-1"></i>3W ago</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-4 mb-4">
                        <div class="candidate-list candidate-grid">
                            <div class="candidate-list-image">
                                <img class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="">
                            </div>
                            <div class="candidate-list-details">
                                <div class="candidate-list-info">
                                    <div class="candidate-list-title">
                                        <h5><a href="candidate-detail.html">Reyna Chung</a></h5>
                                    </div>
                                    <div class="candidate-list-option">
                                        <ul class="list-unstyled">
                                            <li><i class="fas fa-filter pr-1"></i>Transport &amp; Logistics</li>
                                            <li><i class="fas fa-map-marker-alt pr-1"></i>Glen Cove, NY 11542</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="candidate-list-favourite-time">
                                    <a class="candidate-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                                    <span class="candidate-list-time order-1"><i class="far fa-clock pr-1"></i>1H ago</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-4 mb-4">
                        <div class="candidate-list candidate-grid">
                            <div class="candidate-list-image">
                                <img class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar8.png" alt="">
                            </div>
                            <div class="candidate-list-details">
                                <div class="candidate-list-info">
                                    <div class="candidate-list-title">
                                        <h5><a href="candidate-detail.html">Rafael Briggs</a></h5>
                                    </div>
                                    <div class="candidate-list-option">
                                        <ul class="list-unstyled">
                                            <li><i class="fas fa-filter pr-1"></i>Architecture</li>
                                            <li><i class="fas fa-map-marker-alt pr-1"></i>Botchergate, Carlisle</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="candidate-list-favourite-time">
                                    <a class="candidate-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                                    <span class="candidate-list-time order-1"><i class="far fa-clock pr-1"></i>3M ago</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-4 mb-4 mb-md-0">
                        <div class="candidate-list candidate-grid">
                            <div class="candidate-list-image">
                                <img class="img-fluid" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                            </div>
                            <div class="candidate-list-details">
                                <div class="candidate-list-info">
                                    <div class="candidate-list-title">
                                        <h5><a href="candidate-detail.html">Michael Bean</a></h5>
                                    </div>
                                    <div class="candidate-list-option">
                                        <ul class="list-unstyled">
                                            <li><i class="fas fa-filter pr-1"></i>Estate Agency</li>
                                            <li><i class="fas fa-map-marker-alt pr-1"></i>Richmond Hill, NY 11418</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="candidate-list-favourite-time">
                                    <a class="candidate-list-favourite order-2" href="#"><i class="far fa-heart"></i></a>
                                    <span class="candidate-list-time order-1"><i class="far fa-clock pr-1"></i>6D ago</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 text-center mt-4 mt-sm-5">
                        <ul class="pagination justify-content-center mb-0">
                            <li class="page-item disabled"> <span class="page-link">Prev</span> </li>
                            <li class="page-item active" aria-current="page"><span class="page-link">1 </span> <span class="sr-only">(current)</span></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">...</a></li>
                            <li class="page-item"><a class="page-link" href="#">25</a></li>
                            <li class="page-item"> <a class="page-link" href="#">Next</a> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>

	

</body>
</html>