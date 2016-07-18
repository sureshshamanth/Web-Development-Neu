        var searchType = "object";

        var testText = "Hello World";

        $(document).ready(function () {
            $(".fancybox").fancybox({
                openEffect: 'none',
                closeEffect: 'none'
            });


            $('#infoGlyph').popover({ title: 'Search Help', content: 'Sample keywords: Inca, France', trigger: 'hover' });

            $('#object').click(function () {
                var parent = $(this).attr('id');
                $(parent).find('input').val($(this).text());
                searchType = parent;
            });

            $('#artist').click(function () {
                var parent = $(this).attr('id');
                $(parent).find('input').val($(this).text());
                searchType = parent;
            });

            $('#exhibition').click(function () {
                var parent = $(this).attr('id');
                $(parent).find('input').val($(this).text());
                searchType = parent;
            });
        });




        function clickThumbnail(ItemId) {

            $.getJSON("http://query.yahooapis.com/v1/public/yql",
  {
      q: "select * from json where url=\"http://www.brooklynmuseum.org/opencollection/api/?version=1&include_image_caption=false&include_item_fields=true&thumb_shape=original&max_thumb_size=96&max_image_size=384&format=json&include_html_style_block=true&item_type=object&item_id=" + ItemId + "&image_start_index=0&image_results_limit=10&method=collection.getItem&api_key=mS3nIn2Ltx\"",
      format: "json"
  },
  function (data) {

      $("#backSearch").empty();
      $("#backSearch").append('<button class="btn btn-primary" type="button" onclick="SecondSearch()">Back</button> <button class="btn btn-primary" type="button" onclick="SearchHome()"> Clear </button>');
      var archiveimages1 = data.query.results.response.object.images._

      if (!$.isArray(archiveimages1) || !archiveimages1.length) {
          //handler either not an array or empty array
          $("#testingJson").empty();
          $("#testingJson").append('<div class="panel panel-primary"> <div class="panel-heading"> <h3 class="panel-title"> Artifact Information </h3> </div> <div class="panel-body"> <div class="row"> <div class="col-md-4"> <a class="fancybox" href="' + archiveimages1.uri + '"> <img src="' + archiveimages1.uri + '" alt="" style="width: 300px" /> </a> </br> </br> </div> <div class="col-md-8"> <p class = "font">' + 'Collection: ' + data.query.results.response.object.collection + '</br> ' + 'Title: ' + data.query.results.response.object.title + '</br> ' + 'Description: ' + data.query.results.response.object.label + '</br> </p> </div> </div> </div> </div>');
      }
      else {
          var arrLen = archiveimages1.length
          var i = 0;
          $("#testingJson").empty();
          $("#testingJson").append('<div class="panel panel-primary"> <div class="panel-heading"> <h3 class="panel-title"> Artifact Information </h3> </div> <div class="panel-body"> <div class="row"> <div class="col-md-4" id = "imageSide"> <a class="fancybox" rel="group1" href="' + archiveimages1[i].uri + '"> <img src="' + archiveimages1[i].uri + '" alt="" style="padding-bottom: 20px; width: 300px" /> </a> </div> <div class="col-md-8"> <p>' + 'Collection: ' + data.query.results.response.object.collection + '</br> ' + 'Title: ' + data.query.results.response.object.title + '</br> ' + 'Description: ' + data.query.results.response.object.label + '</br> </p> </div> </div> </div> </div>');
          while (i <= arrLen) {

              if (i == 0) {
                  $("#imageSide").append('<div class="panel panel-primary"> <div class="panel-heading"> <h3 class="panel-title"> Related Images </h3> </div> <div class="panel-body" id = "relatedImages"></div></div></div>');
              }
              i = i + 1;
              $("#relatedImages").append('<a class="fancybox" rel="group1" href="' + archiveimages1[i].uri + '"> <img src="' + archiveimages1[i].uri + '" style="height:100px; width:100px; padding-bottom: 20px;" alt=""/> </a>');

          }
      }
  }
);
 }

        function testSearch() {

            
            var sText = document.getElementById("SearchText").value;


            if (String(sText).length == 0) {
                bootbox.alert("Please enter search text");
            }
            else {
                var lim = 20;
                var ide = 0;
                $.getJSON("http://query.yahooapis.com/v1/public/yql",
  {
      q: "select * from json where url=\"http://www.brooklynmuseum.org/opencollection/api/?version=1&include_image_caption=false&include_item_fields=true&thumb_shape=original&max_thumb_size=96&max_image_size=384&format=json&include_html_style_block=true&item_type=" + searchType + "&keyword=" + sText + "&start_index=0&results_limit=" + lim + "&require_image=true&image_results_limit=1&sort_field=relevance&method=collection.search&api_key=mS3nIn2Ltx\"",
      format: "json"
  },
  function (data) {
      var archiveimages = data.query.results.response.resultset.items;
      $("#testingJson").empty();
      $.each(archiveimages, function (index, aimage) {
          if (String(aimage.title).length >= 24 && String(aimage.title).length <= 40) {
          $("#testingJson").append('<div class="col-md-3">  <a onclick="clickThumbnail(this.id)" id = "' + aimage.id + '"> <div class="thumbnail">  <img src="' + aimage.images._.uri + '" style="height:200px;width:250px;"/> <p class = "font">' + aimage.title + '</p></div> </a> </div>');
      
      }
      });
  }
);
            }
        }


        function SecondSearch() {

            $("#backSearch").empty();
            $("#backSearch").append('<button class="btn btn-primary" type="button" onclick="SecondSearch()">Back</button>  <button class="btn btn-primary" type="button" onclick="SearchHome()"> Clear </button>');

            $('#infoGlyph').popover({ title: 'Search Help', content: 'Sample keywords: Inca, France', trigger: 'hover' });

            var sText = document.getElementById("SearchText").value;


            if (String(sText).length == 0) {
                alert("No search text");
            }
            else {
                var lim = 20;
                var ide = 0;
                $.getJSON("http://query.yahooapis.com/v1/public/yql",
  {
      q: "select * from json where url=\"http://www.brooklynmuseum.org/opencollection/api/?version=1&include_image_caption=false&include_item_fields=true&thumb_shape=original&max_thumb_size=96&max_image_size=384&format=json&include_html_style_block=true&item_type=" + searchType + "&keyword=" + sText + "&start_index=0&results_limit=" + lim + "&require_image=true&image_results_limit=1&sort_field=relevance&method=collection.search&api_key=mS3nIn2Ltx\"",
      format: "json"
  },
  function (data) {
      console.log(data);
      var archiveimages = data.query.results.response.resultset.items;
      $("#testingJson").empty();
      $.each(archiveimages, function (index, aimage) {
          if (String(aimage.title).length >= 24 && String(aimage.title).length <= 40) {
              $("#testingJson").append('<div class="col-md-3">  <a onclick="clickThumbnail(this.id)" id = "' + aimage.id + '"> <div class="thumbnail">  <img src="' + aimage.images._.uri + '" style="height:200px;width:250px;"/> <p class = "font">' + aimage.title + '</p></div> </a> </div>');

          }
      });
  }
);
            }
}



function SearchHome() {
    $("#HelpSearchClear").empty();
    $("#testingJson").empty();
    $("#MainFrame").empty();
    $("#Final").empty();

    $("#Final").append(' <div class="input-group" id="MainFrame"> <div class="row"> <div class="col-md-8"> <input type="search" id="SearchText" class="form-control" placeholder="Search for Museum Artifacts"> </div> <div class="col-md-4"> <span class="input-group-btn" id="backSearch">  <button class="btn btn-primary" type="button" onclick="testSearch()"> Search</button>  <span class="glyphicon glyphicon-info-sign" id="infoGlyph" rel="popover"></span>  </span>  </div> </div>  </div>  <div class="row">  <div class="col-md-12" id = "HelpSearchClear">  <h3>Museum Artifacts</h3>   <div id="testingJson"> <img src="images/SearchPageMuseum.jpg" alt="some" style="height: 800px; width: 1100px" /> </div>  <br /> <div id="imageSide"> </div> <br />  </div> </div>');
    $('#infoGlyph').popover({ title: 'Search Help', content: 'Sample keywords: Inca, France', trigger: 'hover' });
}