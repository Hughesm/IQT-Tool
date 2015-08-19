function BindIncidentEvents() {

    $('#alert').hide();

    $('#AreaCol').removeClass('hidden');
    $('#BroughCol').addClass('hidden');
    $('#StationCol').addClass('hidden');

    $('#removeIncidentCat').toggleClass('hidden');

    if ($('#<%=DD_area.ClientID%>').val() == '0') {

        $('#BroughCol').addClass('hidden');
    }
    else {

        $('#BroughCol').removeClass('hidden');

    }
    if ($('#<%=DropDownListBorough.ClientID%>').val() == '0') {

        $('#StationCol').addClass('hidden');
    }
    else {

        $('#StationCol').removeClass('hidden');

    }

};