% Database
%______________________________________________________________________________________________________________

% Health Field:

major(health, medicine, doctor_of_medicine, 98.25).
major(health, dentistry, doctor_of_dentistry, 97.55).
major(health, pharmacy, doctor_of_pharmacy, 96.25).
major(health, pharmacy, pharmacy, 95.85).
major(health, nursing, nursing_men, 93.70).
major(health, nursing, nursing_women, 92.95).
major(health, rehabilitation_sciences, physical_therapy, 93.60).
major(health, rehabilitation_sciences, occupational_therapy, 91.85).
major(health, rehabilitation_sciences, artificial_limbs, 90.40).
major(health, rehabilitation_sciences, hearing_and_speech_sciences, 90.00).

% Engineering and Technology Field:

major(engineering_and_technology, engineering, computer_engineering, 97.05).
major(engineering_and_technology, engineering, industrial_engineering, 96.25).
major(engineering_and_technology, engineering, electrical_engineering, 95.15).
major(engineering_and_technology, engineering, chemical_engineering, 94.05).
major(engineering_and_technology, engineering, civil_engineering, 90.15).
major(engineering_and_technology, engineering, mechanical_engineering, 95.00).
major(engineering_and_technology, engineering, mechatronics_engineering, 95.80).
major(engineering_and_technology, engineering, architecture, 94.30).
major(engineering_and_technology, kasit, computer_science, 96.50).
major(engineering_and_technology, kasit, computer_information_systems, 94.50).
major(engineering_and_technology, kasit, business_information_technology, 91.55).
major(engineering_and_technology, kasit, data_science, 93.20).
major(engineering_and_technology, kasit, cybersecurity, 94.75).
major(engineering_and_technology, kasit, artificial_intelligence, 95.85).
major(engineering_and_technology, science, mathematics, 87.25).
major(engineering_and_technology, science, physics, 84.65).
major(engineering_and_technology, science, chemistry, 88.85).
major(engineering_and_technology, science, industrial_chemistry, 89.20).
major(engineering_and_technology, science, biological_sciences, 86.25).
major(engineering_and_technology, science, geology, 79.55).
major(engineering_and_technology, science, medical_laboratory_sciences, 91.15).
major(engineering_and_technology, science, statistics_and_data_science, 86.10).
major(engineering_and_technology, agriculture, gardening_and_crops, 80.40).
major(engineering_and_technology, agriculture, plant_protection, 80.20).
major(engineering_and_technology, agriculture, site_design_and_coordination, 85.60).
major(engineering_and_technology, agriculture, animal_production, 83.35).
major(engineering_and_technology, agriculture, food_science_and_technology, 92.95).
major(engineering_and_technology, agriculture, human_nutrition_and_diets, 96.35).
major(engineering_and_technology, agriculture, land_water_and_environment, 82.50).
major(engineering_and_technology, agriculture, agricultural_economics_and_agricultural_business_management, 85.15).

% Languages and Humanities Field:

major(languages_and_humanities, languages, english_language_and_literature, 95.30).
major(languages_and_humanities, languages, applied_english, 97.10).
major(languages_and_humanities, languages, french_language_and_literature, 89.15).
major(languages_and_humanities, languages, german_english, 92.55).
major(languages_and_humanities, languages, italian_english, 91.05).
major(languages_and_humanities, languages, spanish_english, 92.85).
major(languages_and_humanities, languages, korean_english, 90.30).
major(languages_and_humanities, languages, chinese_english, 95.05).
major(languages_and_humanities, languages, russian_english, 89.85).
major(languages_and_humanities, languages, turkish_english, 90.75).
major(languages_and_humanities, languages, french_and_english_double_major_program, 92.00).
major(languages_and_humanities, languages, arabic_language_and_literature, 95.35).
major(languages_and_humanities, education, class_teacher_women, 92.15).
major(languages_and_humanities, education, special_education, 90.85).
major(languages_and_humanities, education, early_childhood_education, 86.00).
major(languages_and_humanities, education, counseling_and_mental_health, 91.30).
major(languages_and_humanities, arts, psychology, 92.55).
major(languages_and_humanities, arts, history, 88.10).
major(languages_and_humanities, arts, geography, 88.05).
major(languages_and_humanities, arts, philosophy, 85.80).
major(languages_and_humanities, arts, sociology, 89.40).
major(languages_and_humanities, arts, social_work, 86.50).
major(languages_and_humanities, law, law, 95.60).
major(languages_and_humanities, political_sciences, political_sciences, 91.35).
major(languages_and_humanities, archaeology_and_tourism, antiquities, 84.00).
major(languages_and_humanities, archaeology_and_tourism, heritage_resources_management, 83.75).
major(languages_and_humanities, archaeology_and_tourism, hospitality_management, 86.00).
major(languages_and_humanities, archaeology_and_tourism, tourism_management, 89.40).
major(languages_and_humanities, archaeology_and_tourism, event_management, 88.13).
major(languages_and_humanities, shariah, foundations_of_religion, 88.95).
major(languages_and_humanities, shariah, islamic_jurisprudence_and_its_foundation, 89.70).
major(languages_and_humanities, sports_sciences, physical_education, 90.55).
major(languages_and_humanities, sports_sciences, movement_sciences_and_sports_training, 86.60).

% Business Administration Field:

major(business_administration, business, business_management, 93.55).
major(business_administration, business, accounting, 95.80).
major(business_administration, business, finance, 92.50).
major(business_administration, business, marketing, 94.60).
major(business_administration, business, management_information_systems, 94.50).
major(business_administration, business, public_administration, 91.05).
major(business_administration, business, business_economics, 92.05).
major(business_administration, business, islamic_banks, 89.15).

% Input Functions
%______________________________________________________________________________________________________________

get_input(CleanInput) :-
    read_line_to_string(user_input, RawInput),
    normalize_space(string(Normalized), RawInput),
    downcase_atom(Normalized, CleanInput).

read_number_range(Prompt, Min, Max, Number) :-
    write(Prompt),
    read_line_to_string(user_input, Input),
    normalize_space(atom(Atom), Input),
    (   atom_number(Atom, Value),
        number(Value),
        Value >= Min,
        Value =< Max
    ->  Number = Value
    ;   format('Invalid input. Please enter a number between ~w and ~w.~n', [Min, Max]),
        read_number_range(Prompt, Min, Max, Number)
    ).

get_valid_input(Input) :-
    get_input(RawInput),
    (   (RawInput == yes ; RawInput == no)
    ->  Input = RawInput
    ;   write('Invalid input. Please enter yes or no: '),
        nl,
        flush_output(current_output),
        get_valid_input(Input)
    ).

get_valid_field(Prompt, Field) :-
    write(Prompt),
    nl,
    get_input(RawField),
    (   member(RawField, [health, engineering_and_technology, languages_and_humanities, business_administration])
    ->  Field = RawField
    ;   write('Invalid field entered. Please choose one of the listed fields.'),
        nl,
        flush_output(current_output),
        get_valid_field(Prompt, Field)
    ).

% Failure Check
%______________________________________________________________________________________________________________

check_failure(Grade, Max, Subject) :-
    Grade < Max / 2,
    format('You failed ~w.~n', [Subject]),
    !,
    fail.
check_failure(_, _, _).

% Grade Calculation & Major Choice Functions
%______________________________________________________________________________________________________________

calculate_total_grade(TotalGrade, Field) :-
    write('Please enter your grades for the first year subjects.'), nl,
    read_number_range('Enter your English grade (out of 100): ', 0, 100, EnglishGrade),
    check_failure(EnglishGrade, 100, 'English'),
    read_number_range('Enter your Arabic grade (out of 100): ', 0, 100, ArabicGrade),
    check_failure(ArabicGrade, 100, 'Arabic'),
    read_number_range('Enter your Islamic Education grade (out of 60): ', 0, 60, IslamicEducationGrade),
    check_failure(IslamicEducationGrade, 60, 'Islamic Education'),
    read_number_range('Enter your History of Jordan grade (out of 40): ', 0, 40, HistoryOfJordanGrade),
    check_failure(HistoryOfJordanGrade, 40, 'History of Jordan'),
    TotalGrade1 is (EnglishGrade + ArabicGrade + IslamicEducationGrade + HistoryOfJordanGrade) / 10,
    write('First Year Grade (out of 30): '),
    writeln(TotalGrade1),

    get_valid_field('Enter your field (health, engineering_and_technology, languages_and_humanities, business_administration): ', Field),

    (Field == health ->
        (read_number_range('Advanced English (out of 175): ', 0, 175, AdvancedEnglishGrade),
         check_failure(AdvancedEnglishGrade, 175, 'Advanced English'),
         read_number_range('Chemistry (out of 175): ', 0, 175, ChemistryGrade),
         check_failure(ChemistryGrade, 175, 'Chemistry'),
         read_number_range('Biology (out of 175): ', 0, 175, BiologyGrade),
         check_failure(BiologyGrade, 175, 'Biology'),
         read_number_range('Math (out of 175): ', 0, 175, MathGrade),
         check_failure(MathGrade, 175, 'Math'),
         TotalGrade2 is (AdvancedEnglishGrade + ChemistryGrade + BiologyGrade + MathGrade) / 10,
         write('Second Year Grade (out of 70): '),
         writeln(TotalGrade2))
    ; Field == engineering_and_technology ->
        (read_number_range('Advanced English (out of 175): ', 0, 175, AdvancedEnglishGrade),
         check_failure(AdvancedEnglishGrade, 175, 'Advanced English'),
         read_number_range('Physics (out of 175): ', 0, 175, PhysicsGrade),
         check_failure(PhysicsGrade, 175, 'Physics'),
         read_number_range('Math (out of 175): ', 0, 175, MathGrade),
         check_failure(MathGrade, 175, 'Math'),
         read_number_range('Geology (out of 175): ', 0, 175, GeologyGrade),
         check_failure(GeologyGrade, 175, 'Geology'),
         TotalGrade2 is (AdvancedEnglishGrade + PhysicsGrade + MathGrade + GeologyGrade) / 10,
         write('Second Year Grade (out of 70): '),
         writeln(TotalGrade2))
    ; Field == languages_and_humanities ->
        (read_number_range('Advanced English (out of 175): ', 0, 175, AdvancedEnglishGrade),
         check_failure(AdvancedEnglishGrade, 175, 'Advanced English'),
         read_number_range('Advanced Arabic (out of 175): ', 0, 175, AdvancedArabicGrade),
         check_failure(AdvancedArabicGrade, 175, 'Advanced Arabic'),
         read_number_range('Islamic Studies (out of 175): ', 0, 175, IslamicStudiesGrade),
         check_failure(IslamicStudiesGrade, 175, 'Islamic Studies'),
         read_number_range('Financial Culture (out of 175): ', 0, 175, FinancialCultureGrade),
         check_failure(FinancialCultureGrade, 175, 'Financial Culture'),
         TotalGrade2 is (AdvancedEnglishGrade + AdvancedArabicGrade + IslamicStudiesGrade + FinancialCultureGrade) / 10,
         write('Second Year Grade (out of 70): '),
         writeln(TotalGrade2))
    ; Field == business_administration ->
        (read_number_range('Advanced English (out of 175): ', 0, 175, AdvancedEnglishGrade),
         check_failure(AdvancedEnglishGrade, 175, 'Advanced English'),
         read_number_range('Business Math (out of 175): ', 0, 175, BusinessMathGrade),
         check_failure(BusinessMathGrade, 175, 'Business Math'),
         read_number_range('Financial Culture (out of 175): ', 0, 175, FinancialCultureGrade),
         check_failure(FinancialCultureGrade, 175, 'Financial Culture'),
         read_number_range('Islamic Sciences (out of 175): ', 0, 175, IslamicSciencesGrade),
         check_failure(IslamicSciencesGrade, 175, 'Islamic Sciences'),
         TotalGrade2 is (AdvancedEnglishGrade + BusinessMathGrade + FinancialCultureGrade + IslamicSciencesGrade) / 10,
         write('Second Year Grade (out of 70): '),
         writeln(TotalGrade2))
    ),
    TotalGrade is TotalGrade1 + TotalGrade2,
    write('Calculating your total grade...'), nl,
    write('Total Grade (out of 100): '), writeln(TotalGrade), nl.

% Eligible Majors and Schools Functions
%______________________________________________________________________________________________________________

get_eligible_schools(Field, Grade, Schools) :-
    findall(School, (major(Field, School, _, Min), Grade >= Min), SchoolList),
    sort(SchoolList, Schools).

get_eligible_majors(Field, School, Grade, Majors) :-
    collect_eligible_majors(Field, School, Grade, [], Majors).


collect_eligible_majors(Field, School, Grade, Acc, [Major|Majors]) :-
    major(Field, School, Major, Min),
    Grade >= Min,
    \+ member(Major, Acc),
    collect_eligible_majors(Field, School, Grade, [Major|Acc], Majors).

collect_eligible_majors(Field, School, Grade, Acc, []) :-
    \+ ( major(Field, School, Major, Min),
         Grade >= Min,
         \+ member(Major, Acc)
       ).

listPrinter([]).
listPrinter([H|T]) :-
    write(' - '), writeln(H),
    listPrinter(T).

get_valid_school(Field, Grade, School) :-
    write('Enter the school you are interested in from the list above: '), nl,
    get_input(RawSchool),
    (   get_eligible_schools(Field, Grade, Schools),
        member(RawSchool, Schools)
    ->  School = RawSchool
    ;   write('Invalid or unavailable school. Please choose one of the listed schools.'), nl,
        flush_output(current_output),
        get_valid_school(Field, Grade, School)
    ).

%______________________________________________________________________________________________________________

start :-
    write('Welcome to the University of Jordan Major Recommendation System!'), nl,
    write('Do you know your total grade for both years? (yes/no) '),
    flush_output(current_output),
    get_valid_input(KnowGrade),
    (KnowGrade == yes ->
        (read_number_range('Please enter your total grade (out of 100): ', 0, 100, TotalGrade),
         get_valid_field('Enter your field (health, engineering_and_technology, languages_and_humanities, business_administration): ', Field))
    ;
        calculate_total_grade(TotalGrade, Field)
    ),
    get_eligible_schools(Field, TotalGrade, Schools),
    (Schools == [] ->
        write('No eligible schools found for your grade and field.'), nl
    ;
        write('The schools available for you based on your field and total grade are:'), nl,
        listPrinter(Schools),
        get_valid_school(Field, TotalGrade, SelectedSchool),
        get_eligible_majors(Field, SelectedSchool, TotalGrade, Majors),
        (Majors == [] ->
            write('No eligible majors found in that school for your grade and field.'), nl
        ;
            format('Eligible majors in ~w:~n', [SelectedSchool]),
            listPrinter(Majors)
        )
    ).
