<aside class="categorias_produtos">
                    
    <h2>Categorias</h2>
                    
    <?php for($i=1;$i <= 15;$i++){?>
        <a class="<?php if($i == 1){echo "active";} ?>" href="#">Categoria <?=$i?></a>
    <?php } ?>
                    
</aside>