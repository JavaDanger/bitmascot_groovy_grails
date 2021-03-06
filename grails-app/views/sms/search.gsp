<!DOCTYPE html>
<head>
    <title>Search Page</title>
    <script
            src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
</head>

<body>
<div align = "center">
    <br><br>
    <label>Name</label>
    <g:textField name = "search" id = "search" />
    <br><br>
    <button id = "button" name = "button">Search</button>

    <p id = "hidden"></p>
</div>
</body>

<script>
    $(document).ready(function(){
        $('#button').click(function() {
            var URL="${createLink(controller:'sms',action:'search_Student')}"
            var val_search = $('#search').val();
            //Check if the search box is empty
            if(val_search == "") {
                alert('Search field is empty');
                return false;
            }
            var search = val_search.toUpperCase(); //Convert to uppercase letters
            $.ajax({
                url: URL,
                type: "POST",
                datatype: "html",
                data:{search:search},
                success:function(data)
                {
                    $('#hidden').html(data);
                }
            })
        })
    })
</script>
</html>