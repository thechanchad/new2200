page 50341 "Excel Data"
{
    ApplicationArea = All;
    Caption = 'Excel Data';
    PageType = CardPart;
    SourceTable = Item;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Excel Data"; Rec."Excel Data")
                {
                    ToolTip = 'Specifies the value of the Excel Data field.';
                }
            }

        }



    }
    actions
    {
        area(Processing)
        {
            action("Add Excel Data")
            {
                ApplicationArea = All;
                Image = Add;

                trigger OnAction()
                var
                    InStr: InStream;
                    OutStr: OutStream;
                    Excel: Text[50];

                begin
                    // if UploadIntoStream('', '', '', Excel, InStr) then
                    //     rec."Excel Data".CreateOutStream(OutStr);
                    // CopyStream(OutStr, InStr);
                    // rec.Modify();
                    // InitRecord(Rec."Excel Data")
                end;

            }
            
        }
    }

}
