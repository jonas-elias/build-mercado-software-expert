<?php

declare(strict_types=1);

namespace Jonaselias\ExpertFramework\Model\Produto;

use ExpertFramework\Database\BaseModel;

class TipoProdutoModel extends BaseModel
{
    /**
     * @var string
     */
    protected static string $table = 'tipo_produto';

    /**
     * @var array
     */
    protected static array $columns = ['*'];

    /**
     * @var array
     */
    protected static array $conditionEqual = [
        'data_exclusao' => '0001-01-01',
    ];
}