const renameButtons = document.querySelectorAll('.rename_button');
currentVisibleForm = 
renameButtons.forEach( function(button) {
	button.onclick = function() {addForm(button)};
} );

function addForm(button) {
	id = button.getAttribute( 'name' );
	li = button.parentElement
	rename_form = document.createElement('form');
	rename_form.setAttribute( 'action', 'http://localhost:4567/rename_sport?id=' + id );
	rename_form.setAttribute( 'method', 'POST' );

	rename_input = document.createElement( 'input' );
	rename_input.setAttribute( 'name', 'new_name' );
	rename_input.setAttribute( 'placeholder', 'new name' );
	rename_form.appendChild( rename_input );

	rename_submit = document.createElement( 'button' );
	rename_submit.setAttribute( 'type', 'submit' );
	rename_submit.innerText = 'Apply';
	rename_form.appendChild( rename_submit );

	li.appendChild( rename_form );
}
