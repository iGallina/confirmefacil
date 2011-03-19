function hide_add_button(){

    $("#carregando").show();
    $("#add").hide();

}

function show_add_button(){

    $("#carregando").hide();
    $("#add").show();

}

function periodicRefresh(){
    this.refresh();
	setTimeout("periodicRefresh()", 30000);
}

function refresh(){
		$.post("get_unconfirmed_appointments", function(data, status){});
}
