pageextension 50342 "item Ext" extends "Item Card"
{
    layout
    {
        addafter("Purchasing Code")
        {
            // Part("Excel Data"; "Excel Data")
            // {
            //     ApplicationArea = All;

            //     SubPageLink = "No." = field("No.");
            // }
            field("Excel Data"; Rec."Excel Data")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addfirst(Functions)
        {
            action("Import Excel")
            {
                ApplicationArea = All;
                Image = Excel;

                trigger OnAction()
                var
                    OutStr: OutStream;
                    InStr: InStream;
                    Filename: Text[200];

                begin
                    if UploadIntoStream('', '', '', Filename, InStr) then begin
                        Rec."Excel Data".CreateOutStream(OutStr);
                        CopyStream(OutStr, InStr);
                        Rec.Modify();
                    end;
                end;
            }
            action("Download Excel")
            {
                ApplicationArea = All;
                Image = Download;

                trigger OnAction()
                var
                    instr: InStream;
                    OutStr: OutStream;
                    tmpBlob: Codeunit "Temp Blob";
                    FileName: Text[100];
                    Filemgt_Lcdu: Codeunit "File Management";
                begin
                    FileName := 'Downloded.xlsx';
                    Rec.CalcFields("Excel Data");
                    Rec."Excel Data".CreateInStream(instr);
                    tmpBlob.CreateOutStream(OutStr);
                    CopyStream(OutStr, instr);
                    Filemgt_Lcdu.BLOBExport(tmpBlob, FileName, true);
                    // OutStr.WriteText(Format(Rec."Excel Data"));
                    // tmpBlob.CreateInStream(InStr);
                    // DownloadFromStream(InStr, '', '', '', FileName);
                end;
            }
        }
    }
}
