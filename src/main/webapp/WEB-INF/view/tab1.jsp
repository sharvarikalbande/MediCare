<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dropdown</title>

    <!-- Ext JS CDN  looking for the theme for extjs-->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/extjs/6.0.0/classic/theme-triton/resources/theme-triton-all.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/extjs/6.0.0/ext-all.js"></script>

    <style>
        body {
            font-family: Arial;
            background: #f5f7fa;
            padding: 30px;
        }

        .card {
            width: 650px;
            margin: auto;
            background: white;
            padding: 30px;
        }

        .field {
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        select {
            width: 100%;
            padding: 10px;
        }
    </style>
</head>

<body>

<div class="card">

    <h2>Dropdown Configuration</h2>

    <!-- Plain HTML Dropdown -->
    <div class="field">
        <label>Department</label>

        <select id="department">
            <option value="">-- Select Department --</option>
            <option>Nursing</option>
            <option>Radiology</option>
            <option>Cardiology</option>
            <option>Pathology</option>
            <option>Insurance</option>
            <option>Neurology</option>
            <option>Pediatrics</option>
            <option>Orthopedics</option>
        </select>
    </div>

    <!-- Ext JS Dropdown -->
    <div class="field">
        <label>Department (Ext JS)</label>

        <div id="extDepartment"></div>
    </div>



</div>


<script>

Ext.onReady(function () {
<!-- creates an Ext JS component-->
    Ext.create('Ext.form.ComboBox', {

        renderTo: 'extDepartment',

        width: 590,

        emptyText: 'Search Department...',

        editable: true,

        typeAhead: true,

        queryMode: 'local',

        forceSelection: true,

        store: [
            'Nursing',
            'Radiology',
            'Cardiology',
            'Pathology',
            'Insurance',
            'Neurology',
            'Pediatrics',
            'Orthopedics'
        ]

    });

});


function resetForm() {

    document.getElementById('department').value = '';

    var combo = Ext.ComponentQuery.query('combobox')[0];

    if (combo) {
        combo.reset();
    }
}


</script>

</body>
</html>
