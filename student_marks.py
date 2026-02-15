print("Student Marks Analyzer")

marks = []

for i in range(5):
    score = float(input(f"Enter marks for subject {i+1}: "))
    marks.append(score)

total = sum(marks)
average = total / len(marks)

print("Total Marks:", total)
print("Average Marks:", average)

if average >= 90:
    print("Grade: A")
elif average >= 75:
    print("Grade: B")
elif average >= 60:
    print("Grade: C")
else:
    print("Grade: D")
