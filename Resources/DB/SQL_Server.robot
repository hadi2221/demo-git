*** Settings ***
Library  Dialogs

*** Variables ***
${DB_NAME} =  rftutorial
${DB_USER_NAME} =  rftutorial
${DB_USER_PASSWORD} =  Demoscript1!
${DB_HOST} =  sql1100.shared-servers.com
${DB_PORT} = 1090
${PREVIOUS_ROW_COUNT}

*** Keywords ***
Connect
    Connect To Database  pymssql  ${DB_NAME}  ${DB_USER_NAME}  ${DB_USER_PASSWORD}  ${DB_HOST}  ${DB_PORT}

Save Current Row Count
    ${current_row_count} = Row Count  Select * FROM DemoItems;
    Set Suite Variable  ${PREVIOUS_ROW_COUNT}  ${current_row_count}
    Log  ${current_row_count}

Insert Record
    #Execute SQL Script  Inputs/SQL/insert.text
    Execute SQL String  INSERT INTO DemoItems (ItemName, FirstName) VALUES ('New Item: ' + CAST(GetDate() as VARCHAR(50), '${FIRST_NAME}');

Get Input Data
    # from the dialog library
    ${name} =  Get Value From User  Enter a First Name
    # save it at the suite scope so subsequent test can use it
    Set Suite Variable  ${FIRST_NAME}  ${name}

Verify New Record Added
    ${new_row_count} =  Row Count  SELECT * FROM DemoItems;
    Log  ${new_row_count}
    Should be Equal as Numbers  ${new_row_count}  ${PREVIOUS_ROW_COUNT + 1}

Verify Last Record
    ${queryResults} =  Query  SELECT TOP 1 * FROM DemoItems ORDER BY ItemId DESC
    # Examine the (O-Based) 3rd field of the first record in the results
    Should be Equal as Strings  ${queryResults[0][2]}  ${FIRST_NAME}
    Log  ${queryResults[0][2]}

Log All Rows
    ${queryResults} =  Query  SELECT * FROM DemoItems ORDER BY ItemId
    Log Many  ${queryResults}

Disconnect
    Disconnect from Database