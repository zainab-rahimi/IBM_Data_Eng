def mean(numbers):
    return sum(numbers) / len(numbers)

def median(numbers):
    numbers.sort()
    if len(numbers) % 2 == 0:
        median1 = numbers[len(numbers) // 2]
        median2 = numbers[len(numbers) // 2 - 1]
        my_median = (median1 + median2) / 2
    else:
        my_median = numbers[len(numbers) // 2]
    return my_median

