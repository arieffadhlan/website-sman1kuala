// Sidebar
function toggleNavbar(collapseID) {
	document.getElementById(collapseID).classList.toggle("hidden");
	document.getElementById(collapseID).classList.toggle("bg-white");
	document.getElementById(collapseID).classList.toggle("m-2");
	document.getElementById(collapseID).classList.toggle("py-3");
	document.getElementById(collapseID).classList.toggle("px-6");
}

// Sort Table
function sortTable(n) {
    var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
    table = document.getElementById("datatable");
    switching = true;
    dir = "asc";

    while (switching) {
		switching = false;
		rows = table.rows;
		for (i = 1; i < (rows.length - 1); i++) {
			shouldSwitch = false;
			x = rows[i].getElementsByTagName("TD")[n];
			y = rows[i + 1].getElementsByTagName("TD")[n];

			if (dir == "asc") {
				if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
					shouldSwitch = true;
					break;
				}
			} else if (dir == "desc") {
				if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
					shouldSwitch = true;
					break;
				}
			}
		}

		if (shouldSwitch) {
			rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			switching = true;
			switchcount ++;
		} else {
			if (switchcount == 0 && dir == "asc") {
				dir = "desc";
				switching = true;
			}
		}
    }
}

function searchData() {
	var input, filter, table, tr, td, i, txtValue;
	input = document.getElementById("datatableInput");
	filter = input.value.toUpperCase();
	table = document.getElementById("datatable");
	tr = table.getElementsByTagName("tr");
  
	for (i = 0; i < tr.length; i++) {
	  td = tr[i].getElementsByTagName("td")[0];
		if (td) {
			txtValue = td.textContent || td.innerText;
			if (txtValue.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}
	}
}