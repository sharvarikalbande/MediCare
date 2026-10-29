<style>

    .tab2-container {
        padding: 20px;
    }

    .patient-button {
        background-color: #1677c8;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 14px;
        border-radius: 3px;
        cursor: pointer;
    }

    .patient-button:hover {
        background-color: #125fa0;
    }

</style>


<div class="tab2-container">

    <button class="patient-button"
            onclick="openPatientPopup()">
        Patient Details
    </button>

</div>


<script>

    function openPatientPopup() {
<!-- Create an Ext JS window command -->
        Ext.create('Ext.window.Window', {

            title: 'Patient Details',

            width: 750,

            height: 520,

            modal: true,

            closable: true,

            resizable: true,

            layout: 'fit',

            items: [

                {
                    xtype: 'panel',

                    padding: 20,

                    autoScroll: true,

                    items: [

                        {
                            xtype: 'container',

                            html:
                                '<table style="width:100%; font-size:14px;">' +

                                '<tr>' +
                                '<td style="font-weight:bold; width:130px;">Name</td>' +
                                '<td style="width:20px;">:</td>' +
                                '<td>CT SCAN</td>' +
                                '</tr>' +

                                '<tr>' +
                                '<td style="font-weight:bold;">MRN</td>' +
                                '<td>:</td>' +
                                '<td>CYTOLOGY</td>' +
                                '</tr>' +

                                '<tr>' +
                                '<td style="font-weight:bold;">Date Of Birth</td>' +
                                '<td>:</td>' +
                                '<td>DIGITAL X-RAY</td>' +
                                '</tr>' +

                                '<tr>' +
                                '<td style="font-weight:bold;">Age</td>' +
                                '<td>:</td>' +
                                '<td>FLUID EXAMINATION</td>' +
                                '</tr>' +

                                '<tr>' +
                                '<td style="font-weight:bold;">Gender</td>' +
                                '<td>:</td>' +
                                '<td>GASTROENTEROLOGY INVESTIGATION</td>' +
                                '</tr>' +

                                '<tr>' +
                                '<td style="font-weight:bold;">Address</td>' +
                                '<td>:</td>' +
                                '<td>HAEMATOLOGY</td>' +
                                '</tr>' +

                                '<tr>' +
                                '<td style="font-weight:bold;">Reg Date</td>' +
                                '<td>:</td>' +
                                '<td>HARMONES</td>' +
                                '</tr>' +

                                '<tr>' +
                                '<td style="font-weight:bold;">Status</td>' +
                                '<td>:</td>' +
                                '<td>HISTOPATHOLOGY</td>' +
                                '</tr>' +

                                '</table>' +

                                '<br>' +

                                '<div style="font-weight:bold; margin-bottom:8px;">' +
                                'Text Editor' +
                                '</div>'

                        },

                        {
                            xtype: 'htmleditor',

                            width: '100%',

                            height: 180,

                            value:
                                'CT SCAN, CYTOLOGY, DIGITAL X-RAY, ' +
                                'FLUID EXAMINATION, GASTROENTEROLOGY INVESTIGATION, ' +
                                'HAEMATOLOGY, HARMONES, HISTOPATHOLOGY, ' +
                                'IMMUNO ASSAYS'

                        }

                    ]

                }

            ],

            buttons: [

                {
                    text: 'Close',

                    handler: function (button) {

                        button.up('window').close();

                    }

                }

            ]

        }).show();

    }



</script>